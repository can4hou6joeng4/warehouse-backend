package com.bobochang.warehouse.service.impl;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateRange;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.bobochang.warehouse.config.SystemConstants;
import com.bobochang.warehouse.dto.PageCheckinDto;
import com.bobochang.warehouse.entity.Checkin;
import com.bobochang.warehouse.entity.FaceModel;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.mapper.*;
import com.bobochang.warehouse.service.CheckinService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;
import java.util.*;

@Service
@Slf4j
@Scope("prototype")
public class CheckinServiceImpl implements CheckinService {
    @Autowired
    private SystemConstants constants;

    @Autowired
    private HolidaysMapper holidaysMapper;

    @Autowired
    private WorkdayMapper workdayMapper;

    @Autowired
    private CheckinMapper checkinMapper;

    @Autowired
    private FaceModelMapper faceModelMapper;

    @Value("${face.createFaceModelUrl}")
    private String createFaceModelUrl;

    @Value("${face.checkinUrl}")
    private String checkinUrl;

    @Autowired
    private UserMapper userMapper;

    @Override
    public String validCanCheckIn(int userId, String date) {
        boolean bool_1 = holidaysMapper.searchTodayIsHolidays() != null ? true : false;
        boolean bool_2 = workdayMapper.searchTodayIsWorkday() != null ? true : false;
        String type = "工作日";
        if (DateUtil.date().isWeekend()) {
            type = "节假日";
        }
        if (bool_1) {
            type = "节假日";
        } else if (bool_2) {
            type = "工作日";
        }

        if (type.equals("节假日")) {
            return "节假日不需要考勤";
        } else {
            DateTime now = DateUtil.date();
            String start = DateUtil.today() + " " + constants.attendanceStartTime;
            String end = DateUtil.today() + " " + constants.attendanceEndTime;
            DateTime attendanceStart = DateUtil.parse(start);
            DateTime attendanceEnd = DateUtil.parse(end);
            if(now.isBefore(attendanceStart)){
                return "没到上班考勤开始时间";
            }
            else if(now.isAfter(attendanceEnd)){
                return "超过了上班考勤结束时间";
            }else {
                HashMap map=new HashMap();
                map.put("userId",userId);
                map.put("date",date);
                map.put("start",start);
                map.put("end",end);
                boolean bool=checkinMapper.haveCheckin(map)!=null?true:false;
                return bool?"今日已经考勤，不用重复考勤" : "可以考勤";
            }
        }
    }



    // 签到方法
    @Override
    public Result checkin(HashMap param) {
        Date d1=DateUtil.date();
        Date d2=DateUtil.parse(DateUtil.today()+" "+constants.attendanceTime); // 上班考勤的开始时间
        Date d3=DateUtil.parse(DateUtil.today()+" "+constants.attendanceEndTime);// 上班考勤的结束时间

        int status=1;
        if(d1.compareTo(d2)<=0){
            // 早于上班时间
            status=1;
        }
        else if(d1.compareTo(d2)>0&&d1.compareTo(d3)<0){
            // 迟到了
            status=2;
        }
        else{
            return Result.err(500,"超出考勤时间段，无法考勤");
        }

        // 判断是否存在人脸模型
        int userId= (Integer) param.get("userId");
        String faceModel=faceModelMapper.searchFaceModel(userId);
        if(faceModel==null){
            return Result.err(500,"不存在人脸模型");
        }
        else{
            String path=(String)param.get("path"); // 上传的人脸图片地址

            if(check(path, userId)){
                String city= "测试地址";
                String district= "测试地址";
                String address= "测试地址";
                String country= "测试地址";
                String province= "测试地址";
                // 此处获得到微信小程序给的真实地址
                int risk=1;
                //保存签到记录
                Checkin entity=new Checkin();
                entity.setUserId(userId);
                entity.setAddress(address);
                entity.setCountry(country);
                entity.setProvince(province);
                entity.setCity(city);
                entity.setDistrict(district);
                entity.setStatus((byte) status);
                entity.setRisk(risk);
                entity.setDate(DateUtil.today());
                entity.setCreateTime(d1);
                checkinMapper.insert(entity);
                return Result.ok("签到成功");
            }else{
                return Result.err(500,"人脸识别失败，签到失败");
            }
        }
    }

    public boolean check(String path, int userId){
        try{
            // 设置API接口URL
            String url = checkinUrl;  // 替换为实际的 Flask 应用 URL

            RestTemplate restTemplate = new RestTemplate();

            // 设置请求头
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.MULTIPART_FORM_DATA);

            // 构建请求体
            MultiValueMap<String, Object> requestBody = new LinkedMultiValueMap<>();
            requestBody.add("photo", new FileSystemResource(path));
            requestBody.add("userId", userId);
            requestBody.add("userName","jiangwen");

            // 发送请求
            ResponseEntity<String> response = restTemplate.exchange(
                    url,
                    HttpMethod.POST,
                    new HttpEntity<>(requestBody, headers),
                    String.class
            );

            log.info(String.valueOf(response.getBody()));

            // 处理响应结果
            if (response.getStatusCode().is2xxSuccessful()) {
                if(String.valueOf(response.getBody()).equals("jiangwen")){
                    return true;
                }
                else{
                    return false;
                }
            } else {
                return false;
            }
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            log.error(e.getMessage(), e);
            throw new RuntimeException("HTTP请求错误");
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw new RuntimeException("发生未知错误");
        }
    }

    @Override
    public void createFaceModel(String path, int userId) {

        if(!uploadFaceModel(path, userId)){
            throw new RuntimeException("创建模型失败！");
        }
        else{
            FaceModel entity=new FaceModel();
            entity.setUserId(userId);
            entity.setFaceModel("/images/"+userId+".jpg");
//            faceModelDao.insert(entity);
            faceModelMapper.insert(entity);
        }
    }

    @Override
    public String haceFace(int userId) {
        boolean bool = faceModelMapper.haveFace(userId) != null;
        return bool?"该用户已经有人脸模型了":"可以为该用户创建人脸模型";
    }

    private boolean uploadFaceModel(String path, int userId){
        try{
            // 设置API接口URL
            String url = createFaceModelUrl;  // 替换为实际的 Flask 应用 URL

            System.out.println(path);
            System.out.println(userId);
            System.out.println(url);
            RestTemplate restTemplate = new RestTemplate();

            // 设置请求头
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.MULTIPART_FORM_DATA);

            // 构建请求体
            MultiValueMap<String, Object> requestBody = new LinkedMultiValueMap<>();
            requestBody.add("photo", new FileSystemResource(path));
            requestBody.add("userId", userId);

            // 发送请求
            ResponseEntity<String> response = restTemplate.exchange(
                    url,
                    HttpMethod.POST,
                    new HttpEntity<>(requestBody, headers),
                    String.class
            );

            // 处理响应结果
            if (response.getStatusCode().is2xxSuccessful()) {
                String result = response.getBody();
                System.out.println(result);
                return true;
            } else {
                System.out.println("请求失败");
                return false;
            }
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            log.error(e.getMessage(), e);
            throw new RuntimeException("HTTP请求错误");
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw new RuntimeException("发生未知错误");
        }
    }

    @Override
    public HashMap searchTodayCheckin(int userId) {
        HashMap map=checkinMapper.searchTodayCheckin(userId);
        return map;
    }

    @Override
    public Result searchCheckinDays(int userId) {
        try{
            long days=checkinMapper.searchCheckinDays(userId);
            ArrayList<HashMap> list = checkinMapper.searchAllCheckin(userId);
            HashMap map = new HashMap<>();
            map.put("days",days);
            map.put("list",list);
            return Result.ok(map);
        }catch (Exception e){
            return Result.err(500,String.valueOf(e));
        }
    }

    @Override
    public long searchCheckinDaysCount(int userId) {
        long days=checkinMapper.searchCheckinDays(userId);
        return days;
    }

    @Override
    public ArrayList<HashMap> searchWeekCheckin(HashMap param) {
        // 查看这一段时间的考勤天数
        ArrayList<HashMap> checkinList=checkinMapper.searchWeekCheckin(param);

        // 查看这一段时间的特殊节假日
        ArrayList holidaysList=holidaysMapper.searchHolidaysInRange(param);

//        查看这一段时间的特殊工作日
        ArrayList workdayList=workdayMapper.searchWorkdayInRange(param);

        // 获取开始日期和结束日期，构造一个集合
        DateTime startDate=DateUtil.parseDate(param.get("startDate").toString());
        DateTime endDate=DateUtil.parseDate(param.get("endDate").toString());
        DateRange range=DateUtil.range(startDate,endDate, DateField.DAY_OF_MONTH);

        // 判断一周内每日是否特殊工作日和特殊节假日
        ArrayList<HashMap> list=new ArrayList<>();
        range.forEach(one->{
            String date=one.toString("yyyy-MM-dd");
            String type="工作日";
            // 判断是否是周末先，是周末就先定义为节假日
            if(one.isWeekend()){
                type="节假日";
            }

            // 判断当日是否是特殊节假日
            if(holidaysList!=null&&holidaysList.contains(date)){
                type="节假日";
            }

            // 判断当日是否是特殊工作日
            else if(workdayList!=null&&workdayList.contains(date)){
                type="工作日";
            }

            String status=""; // 空字符串
            // 这里判断当天是否已经发生了，不是未来的日期
            // DateUtil.compare(获取到的这天,当天)<=0  <=0说明当天已经发生了
            if(type.equals("工作日")&&DateUtil.compare(one,DateUtil.date())<=0){
                status="缺勤";
                boolean flag=false; // 用于控制for循环跳出
                // 从之前拿到的本周考勤天数，然后用当天和他比较，如果有就取当日的考勤状况
                for (HashMap<String,String> map:checkinList){
                    if(map.containsValue(date)){
                        status=map.get("status");
                        flag=true;
                        break;
                    }
                }
                // 判断当天是否已经过完
                DateTime endTime=DateUtil.parse(DateUtil.today()+" "+constants.attendanceEndTime);
                String today=DateUtil.today();
                if(date.equals(today)&&DateUtil.date().isBefore(endTime)&&flag==false){
                    status="";
                }
            }
            if(type.equals("节假日")&&DateUtil.compare(one,DateUtil.date())<=0){
                status="节假日";
            }
            // 返回对象
            HashMap map=new HashMap();
            map.put("date",date);
            map.put("status",status);
            map.put("type",type);
            map.put("day",one.dayOfWeekEnum().toChinese("周"));
            list.add(map);
        });
        return list;
    }

    @Override
    public ArrayList<HashMap> searchMonthCheckin(HashMap param) {
        return this.searchWeekCheckin(param);
    }

    @Override
    public PageCheckinDto queryChekinPage(PageCheckinDto page, Checkin checkin) {
        // 查询合同总行数
        int checkinCount = checkinMapper.selectCheckinCount(page);
        log.info(page.getStartDate());
        // 分页查询合同
        ArrayList<HashMap> list = checkinMapper.selectCheckinPage(page,checkin);

        // 将查询到的总行数和当前页数据组装到 Page 对象
        page.setTotalNum(checkinCount);
        page.setResultList(list);
        return page;
    }


}
