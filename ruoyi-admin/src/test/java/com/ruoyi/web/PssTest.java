package com.ruoyi.web;

import com.ruoyi.tm.domain.UserInfo;
import com.ruoyi.tm.service.IUserInfoService;
import com.ruoyi.web.controller.tm.UserInfoController;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class PssTest {
    @Autowired
    private IUserInfoService userInfoService;
    private UserInfoController  userInfoController;
    @Test
    public void testUserInfo(){
//        UserInfo userInfo = new UserInfo();
//        userInfo.setType((long)2);
//        Long id = (long)1;
//        System.out.println(userInfoService.selectUserInfoById(id));
//        System.out.println(userInfoService.selectUserInfoList(userInfo));
        System.out.println(userInfoController.data());
    }
}
