package com.ruoyi.tm.service;

import java.util.List;
import com.ruoyi.tm.domain.StuInfo;
import org.springframework.stereotype.Service;


/**
 * StudentService接口
 * 
 * @author clement
 * @date 2024-06-18
 */



public interface IStuInfoService 
{
    /**
     * 查询Student
     * 
     * @param id Student主键
     * @return Student
     */
    public StuInfo selectStuInfoById(Long id);

    /**
     * 查询Student列表
     * 
     * @param stuInfo Student
     * @return Student集合
     */
    public List<StuInfo> selectStuInfoList(StuInfo stuInfo);

    /**
     * 新增Student
     * 
     * @param stuInfo Student
     * @return 结果
     */
    public int insertStuInfo(StuInfo stuInfo);

    /**
     * 修改Student
     * 
     * @param stuInfo Student
     * @return 结果
     */
    public int updateStuInfo(StuInfo stuInfo);

    /**
     * 批量删除Student
     * 
     * @param ids 需要删除的Student主键集合
     * @return 结果
     */
    public int deleteStuInfoByIds(Long[] ids);

    /**
     * 删除Student信息
     * 
     * @param id Student主键
     * @return 结果
     */
    public int deleteStuInfoById(Long id);


    /**
     * 批量导入信息
     *
     * @param userList 学生信息集合
     * @param updateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    public String importUser(List<StuInfo> userList, boolean updateSupport, String operName);
}
