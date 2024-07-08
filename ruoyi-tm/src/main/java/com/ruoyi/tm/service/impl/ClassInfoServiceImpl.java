package com.ruoyi.tm.service.impl;

import java.util.List;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanValidators;
import com.ruoyi.tm.domain.TeaInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.tm.mapper.ClassInfoMapper;
import com.ruoyi.tm.domain.ClassInfo;
import com.ruoyi.tm.service.IClassInfoService;

import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

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


    /**
     * 批量导入班级信息
     *
     * @param ClassList      课程信息集合
     * @param updateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    @Override
    public String importClass(List<ClassInfo> ClassList, boolean updateSupport, String operName) {
        if (StringUtils.isNull(ClassList) || ClassList.size() == 0)
        {
            throw new ServiceException("导入班级数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (ClassInfo classinfo : ClassList)
        {
            try
            {
                ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
                Validator validator = factory.getValidator();
                BeanValidators.validateWithException(validator,classinfo);
                classinfo.setCreateBy(operName);
                this.insertClassInfo(classinfo);
                successNum++;
                successMsg.append("<br/>" + successNum + "、班级 " + classinfo.getId() + " 导入成功");

            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "、班级 " + classinfo.getId() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
            }
        }
        if (failureNum > 0)
        {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        }
        else
        {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }
}
