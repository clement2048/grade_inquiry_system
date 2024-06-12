package com.ruoyi.tm.mapper;

import java.util.List;

import com.ruoyi.tm.domain.Score;
import com.ruoyi.tm.domain.UserInfo;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户信息Mapper接口
 * 
 * @author Offshore
 * @date 2024-04-10
 */
@Mapper
public interface UserInfoMapper 
{
    /**
     * 查询用户信息
     * 
     * @param id 用户信息主键
     * @return 用户信息
     */
    public UserInfo selectUserInfoById(Long id);

    /**
     * 查询用户信息列表
     * 
     * @param userInfo 用户信息
     * @return 用户信息集合
     */
    public List<UserInfo> selectUserInfoList(UserInfo userInfo);

    /**
     * 新增用户信息
     * 
     * @param userInfo 用户信息
     * @return 结果
     */
    public int insertUserInfo(UserInfo userInfo);

    /**
     * 修改用户信息
     * 
     * @param userInfo 用户信息
     * @return 结果
     */
    public int updateUserInfo(UserInfo userInfo);

    /**
     * 删除用户信息
     * 
     * @param id 用户信息主键
     * @return 结果
     */
    public int deleteUserInfoById(Long id);

    /**
     * 批量删除用户信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUserInfoByIds(Long[] ids);


    /**
     * 通过id查找对应学生的成绩
     *
     * @param id 查询的学生的逐渐
     * @return 结果
     */
    public List<Score> selectStuScoreById(Long id);
}
