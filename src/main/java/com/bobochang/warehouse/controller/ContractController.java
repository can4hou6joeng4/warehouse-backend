//package com.bobochang.warehouse.controller;
//
//import com.bobochang.warehouse.annotation.BusLog;
//import com.bobochang.warehouse.constants.WarehouseConstants;
//import com.bobochang.warehouse.entity.Contract;
//import com.bobochang.warehouse.entity.Result;
//import com.bobochang.warehouse.entity.Store;
//import com.bobochang.warehouse.page.Page;
//import com.bobochang.warehouse.service.ContractService;
//import lombok.SneakyThrows;
//import org.apache.coyote.Response;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.core.io.ClassPathResource;
//import org.springframework.core.io.FileSystemResource;
//import org.springframework.core.io.Resource;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.util.ResourceUtils;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//
//import java.io.File;
//import java.io.FileNotFoundException;
//import java.io.IOException;
//import java.nio.file.Files;
//import java.nio.file.Path;
//import java.util.Date;
//import java.util.List;
//
///**
// * @author bobochang
// * @Description
// * @Date 2023/9/19 - 11:11
// */
//@RequestMapping("/contract")
//@RestController
//@Transactional
//@BusLog(name = "合同管理")
//public class ContractController {
//
//    @Autowired
//    private ContractService contractService;
//
//    @Value("${file.upload-path}")
//    private String uploadPath;
//
//    /**
//     * 分页查询仓库的url接口/contract/contract-list
//     * <p>
//     * 参数Page对象用于接收请求参数页码pageNum、每页行数pageSize;
//     * 参数Store对象用于接收请求参数合同名称storeName、合同状态storeAddress、
//     * 联系人concat、联系电话phone;
//     * <p>
//     * 返回值Result对象向客户端响应组装了所有分页信息的Page对象;
//     */
//    @GetMapping("/contract-list")
//    public Result findAllContract(Page page, Contract contract) {
//        page = contractService.queryContractPage(page, contract);
//        return Result.ok(page);
//    }
//
//    @PostMapping("/addContract")
//    @BusLog(descrip = "添加合同")
//    public Result addContract(@RequestBody Contract contract) {
//        return contractService.saveContract(contract);
//    }
//
//    @PutMapping("/updateState")
//    @BusLog(descrip = "更新合同状态")
//    public Result updateContractState(@RequestBody Contract contract) {
//        contract.setUpdateTime(new Date());
//        return contractService.updateContractState(contract);
//    }
//
//    @PutMapping("/updateContract")
//    @BusLog(descrip = "更新合同")
//    public Result updateContract(@RequestBody Contract contract) {
//        contract.setUpdateTime(new Date());
//        return contractService.updateContractName(contract);
//    }
//
//    /**
//     * 合同上传文件的接口
//     *
//     * @param file 上传的文件
//     * @return
//     */
//    @CrossOrigin
//    @PostMapping("/img-upload")
//    @BusLog(descrip = "上传合同文件")
//    public Result uploadImg(MultipartFile file) {
//
//        try {
//            //拿到图片保存到的磁盘路径
//            String fileUploadPath = uploadPath + "\\" + file.getOriginalFilename();
//            //保存图片
//            file.transferTo(new File(fileUploadPath));
//            //成功响应
//            return Result.ok("图片上传成功！");
//        } catch (IOException e) {
//            //失败响应
//            return Result.err(Result.CODE_ERR_BUSINESS, "图片上传失败！");
//        }
//    }
//
//    /**
//     * 分页查询仓库的url接口/contract/contract-list
//     * <p>
//     * 参数Page对象用于接收请求参数页码pageNum、每页行数pageSize;
//     * 参数Store对象用于接收请求参数合同名称storeName、合同状态storeAddress、
//     * 联系人concat、联系电话phone;
//     * <p>
//     * 返回值Result对象向客户端响应组装了所有分页信息的Page对象;
//     */
//    @RequestMapping("/exportTable")
//    public Result exportTable(Page page, Contract contract) {
//        //分页查询仓库
//        page = contractService.queryContractPage(page, contract);
//        //拿到当前页数据
//        List<?> resultList = page.getResultList();
//        //响应
//        return Result.ok(resultList);
//    }
//
//    /**
//     * 下载合同图片 /contract/download-image/{imgName}
//     *
//     * @param imgName 图片名称
//     * @return 图片资源文件
//     * @throws IOException
//     */
//    @SneakyThrows
//    @GetMapping("/download-image/{imgName}")
//    @BusLog(descrip = "下载合同图片")
//    public ResponseEntity<Resource> downloadImage(@PathVariable String imgName) throws IOException {
//        //拿到图片保存到的磁盘路径
//        String fileUploadPath = uploadPath + "\\" + imgName;
//        // 读取图片文件
//        Resource resource = new FileSystemResource(fileUploadPath);
//
//        // 设置响应头部信息，用于告诉浏览器以附件形式下载文件
//        HttpHeaders headers = new HttpHeaders();
//        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=image.jpg");
//
//        return ResponseEntity.ok()
//                .headers(headers)
//                .contentType(MediaType.IMAGE_JPEG)
//                .body(resource);
//    }
//}
