package com.ruoyi.tm.service;

import java.util.List;
import com.ruoyi.tm.domain.ClassInfo;

/**
 * 班级信息Service接口
 * 
 * @author ruoyi
 * @date 2024-07-08
 */
public interface IClassInfoService 
{
    /**
     * 查询班级信息
     * 
     * @param id 班级信息主键
     * @return 班级信息
     */
    public ClassInfo selectClassInfoById(Long id);

    /**
     * 查询班级信息列表
     * 
     * @param classInfo 班级信息
     * @return 班级信息集合
     */
    public List<ClassInfo> selectClassInfoList(ClassInfo classInfo);

    /**
     * 新增班级信息
     * 
     * @param classInfo 班级信息
     * @return 结果
     */
    public int insertClassInfo(ClassInfo classInfo);

    /**
     * 修改班级信息
     * 
     * @param classInfo 班级信息
     * @return 结果
     */
    public int updateClassInfo(ClassInfo classInfo);

    /**
     * 批量删除班级信息
     * 
     * @param ids 需要删除的班级信息主键集合
     * @return 结果
     */
    public int deleteClassInfoByIds(Long[] ids);

    /**
     * 删除班级信息信息
     * 
     * @param id 班级信息主键
     * @return 结果
     */
    public int deleteClassInfoById(Long id);

    /**
     * 班主任id查询班级信息
     *
     * @param id 班主任id
     * @return 结果
     */
    public ClassInfo selectClassByTeacherId(Long id);


    /**
     * 批量导入教师信息
     *
     * @param ClassList 课程信息集合
     * @param updateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    public String importClass(List<ClassInfo> ClassList, boolean updateSupport, String operName);
}
