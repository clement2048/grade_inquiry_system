package com.ruoyi.tm.service.impl;

import java.util.List;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanValidators;
import com.ruoyi.tm.domain.CourseInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.tm.mapper.ChooseCourseMapper;
import com.ruoyi.tm.domain.ChooseCourse;
import com.ruoyi.tm.service.IChooseCourseService;

import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

/**
 * 选课Service业务层处理
 * 
 * @author clement
 * @date 2024-07-06
 */
@Service
public class ChooseCourseServiceImpl implements IChooseCourseService 
{
    @Autowired
    private ChooseCourseMapper chooseCourseMapper;

    /**
     * 查询选课
     * 
     * @param id 选课主键
     * @return 选课
     */
    @Override
    public ChooseCourse selectChooseCourseById(Long id)
    {
        return chooseCourseMapper.selectChooseCourseById(id);
    }

    /**
     * 查询选课列表
     * 
     * @param chooseCourse 选课
     * @return 选课
     */
    @Override
    public List<ChooseCourse> selectChooseCourseList(ChooseCourse chooseCourse)
    {
        return chooseCourseMapper.selectChooseCourseList(chooseCourse);
    }

    /**
     * 新增选课
     * 
     * @param chooseCourse 选课
     * @return 结果
     */
    @Override
    public int insertChooseCourse(ChooseCourse chooseCourse)
    {
        return chooseCourseMapper.insertChooseCourse(chooseCourse);
    }

    /**
     * 新增带id的选课
     *
     * @param chooseCourse 选课
     * @return 结果
     */
    public int insertChooseCourseWithID(ChooseCourse chooseCourse)
    {
        return chooseCourseMapper.insertChooseCourse(chooseCourse);
    }

    /**
     * 修改选课
     * 
     * @param chooseCourse 选课
     * @return 结果
     */
    @Override
    public int updateChooseCourse(ChooseCourse chooseCourse)
    {
        return chooseCourseMapper.updateChooseCourse(chooseCourse);
    }

    /**
     * 批量删除选课
     * 
     * @param ids 需要删除的选课主键
     * @return 结果
     */
    @Override
    public int deleteChooseCourseByIds(Long[] ids)
    {
        return chooseCourseMapper.deleteChooseCourseByIds(ids);
    }

    /**
     * 删除选课信息
     * 
     * @param id 选课主键
     * @return 结果
     */
    @Override
    public int deleteChooseCourseById(Long id)
    {
        return chooseCourseMapper.deleteChooseCourseById(id);
    }

    /**
     * 批量导入选课信息
     *
     * @param chooseList 选课信息集合
     * @param updateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    @Override
    public String importChoose(List<ChooseCourse> chooseList, boolean updateSupport, String operName){
        if (StringUtils.isNull(chooseList) || chooseList.size() == 0)
        {
            throw new ServiceException("导入课程数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (ChooseCourse choose : chooseList)
        {
            try
            {
                ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
                Validator validator = factory.getValidator();
                BeanValidators.validateWithException(validator, choose);
                choose.setCreateBy(operName);
                this.insertChooseCourseWithID(choose);
                successNum++;
                successMsg.append("<br/>" + successNum + "、选课 " + choose.getId() + " 导入成功");

            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "、选课 " + choose.getId() + " 导入失败：";
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

    /**
     * 获取挂科数量
     */
    public ChooseCourse getNotPassNum(){
        return chooseCourseMapper.getNotPassNum();
    }
}
