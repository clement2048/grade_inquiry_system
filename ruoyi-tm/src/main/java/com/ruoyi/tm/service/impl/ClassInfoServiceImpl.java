package com.ruoyi.tm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.tm.mapper.ClassInfoMapper;
import com.ruoyi.tm.domain.ClassInfo;
import com.ruoyi.tm.service.IClassInfoService;

/**
 * 班级管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-07
 */
@Service
public class ClassInfoServiceImpl implements IClassInfoService 
{
    @Autowired
    private ClassInfoMapper classInfoMapper;

    /**
     * 查询班级管理
     * 
     * @param id 班级管理主键
     * @return 班级管理
     */
    @Override
    public ClassInfo selectClassInfoById(Long id)
    {
        return classInfoMapper.selectClassInfoById(id);
    }

    /**
     * 查询班级管理列表
     * 
     * @param classInfo 班级管理
     * @return 班级管理
     */
    @Override
    public List<ClassInfo> selectClassInfoList(ClassInfo classInfo)
    {
        return classInfoMapper.selectClassInfoList(classInfo);
    }

    /**
     * 新增班级管理
     * 
     * @param classInfo 班级管理
     * @return 结果
     */
    @Override
    public int insertClassInfo(ClassInfo classInfo)
    {
        return classInfoMapper.insertClassInfo(classInfo);
    }

    /**
     * 修改班级管理
     * 
     * @param classInfo 班级管理
     * @return 结果
     */
    @Override
    public int updateClassInfo(ClassInfo classInfo)
    {
        return classInfoMapper.updateClassInfo(classInfo);
    }

    /**
     * 批量删除班级管理
     * 
     * @param ids 需要删除的班级管理主键
     * @return 结果
     */
    @Override
    public int deleteClassInfoByIds(Long[] ids)
    {
        return classInfoMapper.deleteClassInfoByIds(ids);
    }

    /**
     * 删除班级管理信息
     * 
     * @param id 班级管理主键
     * @return 结果
     */
    @Override
    public int deleteClassInfoById(Long id)
    {
        return classInfoMapper.deleteClassInfoById(id);
    }

    /**
     * 班主任id查询班级信息
     *
     * @param id 班主任id
     * @return 结果
     */
    public ClassInfo selectClassByTeacherId(Long id){
        return classInfoMapper.selectClassByTeacherId(id);
    }
}
