package com.bobochang.warehouse.controller;

import com.bobochang.warehouse.annotation.BusLog;
import com.bobochang.warehouse.constants.WarehouseConstants;
import com.bobochang.warehouse.dto.ContractReasonDto;
import com.bobochang.warehouse.dto.MaterialNumDto;
import com.bobochang.warehouse.entity.Contract;
import com.bobochang.warehouse.entity.Flow;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.entity.Store;
import com.bobochang.warehouse.page.Page;
import com.bobochang.warehouse.service.ActivitiService;
import com.bobochang.warehouse.service.ContractService;
import com.bobochang.warehouse.utils.TokenUtils;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Date;
import java.util.List;

/**
 * @author bobochang
 * @Description
 * @Date 2023/9/19 - 11:11
 */
@RequestMapping("/contract")
@RestController
@Transactional
@BusLog(name = "合同管理")
@Slf4j
public class ContractController {

    @Autowired
    private ContractService contractService;

    @Value("${file.upload-path}")
    private String uploadPath;
    
    @Autowired
    private TokenUtils tokenUtils;
    
    @Autowired
    private ActivitiService activitiService;

    /**
     * 分页查询仓库的url接口/contract/contract-list
     * <p>
     * 参数Page对象用于接收请求参数页码pageNum、每页行数pageSize;
     * 参数Store对象用于接收请求参数合同名称storeName、合同状态storeAddress、
     * 联系人concat、联系电话phone;
     * <p>
     * 返回值Result对象向客户端响应组装了所有分页信息的Page对象;
     */
    @GetMapping("/contract-list")
    public Result findAllContract(Page page, Contract contract) {
        page = contractService.queryContractPage(page, contract);
        return Result.ok(page);
    }

    @PostMapping("/addContract")
    @BusLog(descrip = "添加合同")
    public Result addContract(@RequestBody Contract contract) {
        return contractService.saveContract(contract);
    }

    @PutMapping("/updateState")
    @BusLog(descrip = "更新合同状态")
    public Result updateContractState(@RequestBody Contract contract) {
        contract.setUpdateTime(new Date());
        int i = contractService.updateContractState(contract);
        if(i>0){
            return Result.ok("更新成功！");
        }
        return Result.err(500,"修改失败");
    }

    @PutMapping("/updateContract")
    @BusLog(descrip = "更新合同")
    public Result updateContract(@RequestBody Contract contract) {
        contract.setUpdateTime(new Date());
        return contractService.updateContractById(contract);
    }

    /**
     * 合同上传文件的接口
     *
     * @param file 上传的文件
     * @return
     */
    @CrossOrigin
    @PostMapping("/img-upload")
    @BusLog(descrip = "上传合同文件")
    public Result uploadImg(MultipartFile file) {

        try {
            //拿到图片保存到的磁盘路径
            String fileUploadPath = uploadPath + "\\" + file.getOriginalFilename();
            //保存图片
            file.transferTo(new File(fileUploadPath));
            //成功响应
            return Result.ok("图片上传成功！");
        } catch (IOException e) {
            //失败响应
            return Result.err(Result.CODE_ERR_BUSINESS, "图片上传失败！");
        }
    }

    /**
     * 分页查询仓库的url接口/contract/contract-list
     * <p>
     * 参数Page对象用于接收请求参数页码pageNum、每页行数pageSize;
     * 参数Store对象用于接收请求参数合同名称storeName、合同状态storeAddress、
     * 联系人concat、联系电话phone;
     * <p>
     * 返回值Result对象向客户端响应组装了所有分页信息的Page对象;
     */
    @RequestMapping("/exportTable")
    public Result exportTable(Page page, Contract contract) {
        //分页查询仓库
        page = contractService.queryContractPage(page, contract);
        //拿到当前页数据
        List<?> resultList = page.getResultList();
        //响应
        return Result.ok(resultList);
    }

    /**
     * 下载合同图片 /contract/download-image/{imgName}
     *
     * @param imgName 图片名称
     * @return 图片资源文件
     * @throws IOException
     */
    @SneakyThrows
    @GetMapping("/download-image/{imgName}")
    @BusLog(descrip = "下载合同图片")
    public ResponseEntity<Resource> downloadImage(@PathVariable String imgName) throws IOException {
        //拿到图片保存到的磁盘路径
        String fileUploadPath = uploadPath + "\\" + imgName;
        log.info(imgName);
        // 读取图片文件
        Resource resource = new FileSystemResource(fileUploadPath);

        // 设置响应头部信息，用于告诉浏览器以附件形式下载文件
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=image.jpg");

        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.IMAGE_JPEG)
                .body(resource);
    }

    @SneakyThrows
    @GetMapping("/inline-image/{imgName}")
    public ResponseEntity<Resource> inlineImage(@PathVariable String imgName) throws IOException {
        //拿到图片保存到的磁盘路径
        String fileUploadPath = uploadPath + "\\" + imgName;
        log.info(imgName);
        // 读取图片文件
        Resource resource = new FileSystemResource(fileUploadPath);

        // 设置响应头部信息，用于告诉浏览器以附件形式下载文件
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=image.jpg");

        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.IMAGE_JPEG)
                .body(resource);
    }
    
    @GetMapping("/contract-all")
    public Result selectAllContract(){
        return contractService.selectAllContract();
    }

    /**
     * 审核合同，如果同意
     * @param token
     * @param contract 包含合同id
     * @return
     */
    @PostMapping("/contract-agree")
    public Result contractAgree(@RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String token,
                               @RequestBody Contract contract){
        String userCode = tokenUtils.getCurrentUser(token).getUserCode();
        contract.setContractState("2");
        int i = contractService.updateContractState(contract);
        if(i>0){
            Flow flow = new Flow();
            flow.setContractId(contract.getContractId());
            return activitiService.completeTask(userCode, flow);
        }else{
            return Result.err(500,"修改合同状态失败");
        }
    }

    /**
     * 重新递交合同进行审核
     * @param token
     * @param contract 包括合同id
     * @return
     */
    @PostMapping("/contract-again")
    public Result contractAgain(@RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String token,
                               @RequestBody Contract contract){
        contract.setContractState("0");
        log.info(contract.getIfPurchase());
        log.info(String.valueOf(contract.getContractId()));
        int i = contractService.updateContractState(contract);
        if(i>0){
            return activitiService.againInstance(contract);
        }else{
            return Result.err(500,"修改合同状态失败");
        }
    }

    /**
     * 驳回合同
     * @param token
     * @param contractReasonDto 包括驳回原因
     * @return
     * @throws Exception
     */
    @PostMapping("/contract-reject")
    public Result contractReject(@RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String token,
                                 @RequestBody ContractReasonDto contractReasonDto) throws Exception {
        String userCode = tokenUtils.getCurrentUser(token).getUserCode();
        Contract contract = new Contract();
        contract.setContractId(contractReasonDto.getContractId());
        contract.setContractState("1");
        int i = contractService.updateContractState(contract);
        if (i > 0) {
            Flow flow = new Flow();
            flow.setContractId(contract.getContractId());
            return activitiService.skipTask(userCode, contractReasonDto);
        } else {
            return Result.err(500, "修改合同状态失败");
        }
    }

    /**
     * 查询该合同生产产品所需要的原材料的用量
     * @param materialNumDto 包含合同id，材料id
     * @return
     */
    @GetMapping("/material-num")
    public Result getNeedMaterialNum(MaterialNumDto materialNumDto){
        return contractService.getNeedMaterialNum(materialNumDto);
    }
}
