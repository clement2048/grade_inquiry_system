package com.ruoyi.tm.service;

import java.util.List;
import com.ruoyi.tm.domain.ClassInfo;

/**
 * 班级管理Service接口
 * 
 * @author ruoyi
 * @date 2024-07-07
 */
public interface IClassInfoService 
{
    /**
     * 查询班级管理
     * 
     * @param id 班级管理主键
     * @return 班级管理
     */
    public ClassInfo selectClassInfoById(Long id);

    /**
     * 查询班级管理列表
     * 
     * @param classInfo 班级管理
     * @return 班级管理集合
     */
    public List<ClassInfo> selectClassInfoList(ClassInfo classInfo);

    /**
     * 新增班级管理
     * 
     * @param classInfo 班级管理
     * @return 结果
     */
    public int insertClassInfo(ClassInfo classInfo);

    /**
     * 修改班级管理
     * 
     * @param classInfo 班级管理
     * @return 结果
     */
    public int updateClassInfo(ClassInfo classInfo);

    /**
     * 批量删除班级管理
     * 
     * @param ids 需要删除的班级管理主键集合
     * @return 结果
     */
    public int deleteClassInfoByIds(Long[] ids);

    /**
     * 删除班级管理信息
     * 
     * @param id 班级管理主键
     * @return 结果
     */
    public int deleteClassInfoById(Long id);
}
