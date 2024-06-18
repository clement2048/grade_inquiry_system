package com.ruoyi.web;

import com.ruoyi.tm.domain.Score;
import com.ruoyi.tm.domain.StuInfo;
import com.ruoyi.tm.domain.UserInfo;
import com.ruoyi.tm.service.IStuInfoService;
import com.ruoyi.tm.service.IUserInfoService;
import com.ruoyi.tm.service.impl.StuInfoServiceImpl;
import com.ruoyi.web.controller.monitor.ServerController;
import com.ruoyi.web.controller.tm.UserInfoController;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class PssTest {
//    @Autowired
//    private IUserInfoService userInfoService;
//    private UserInfoController  userInfoController;
    @Autowired
    private IStuInfoService StuInfoService;
    @Test
    public void testUserInfo(){
//        UserInfo userInfo = new UserInfo();
//        userInfo.setType((long)2);
//        Long id = (long)1;
//        System.out.println(userInfoService.selectStuScoreById(id));

        StuInfo stuInfo = new StuInfo();
        stuInfo.setName("李四");
        stuInfo.setSex((long)1);
        stuInfo.setType("普通本科");
        stuInfo.setInSchool((long)1);
//        stuInfo.setStuStatus((long)1);
//        stuInfo.setAdmMethod("1");
        stuInfo.setMajorId((long)1);
        stuInfo.setClassId((long)1);


        System.out.println(StuInfoService.insertStuInfo(stuInfo));

//        System.out.println(userInfoService.selectUserInfoList(userInfo));
//        System.out.println(userInfoController.data());
//        Score score = new Score();
//        score.setId((long)1);
//        System.out.println(userInfoController.data(score.getId()));
    }
}
