package com.ruoyi.tm.service.impl;

import java.util.List;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanValidators;
import com.ruoyi.tm.domain.MajorInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.tm.mapper.CourseInfoMapper;
import com.ruoyi.tm.domain.CourseInfo;
import com.ruoyi.tm.service.ICourseInfoService;

import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

/**
 * 课程信息Service业务层处理
 * 
 * @author clement
 * @date 2024-07-07
 */
@Service
public class CourseInfoServiceImpl implements ICourseInfoService 
{
    @Autowired
    private CourseInfoMapper courseInfoMapper;

    /**
     * 查询课程信息
     * 
     * @param id 课程信息主键
     * @return 课程信息
     */
    @Override
    public CourseInfo selectCourseInfoById(Long id)
    {
        return courseInfoMapper.selectCourseInfoById(id);
    }

    /**
     * 查询课程信息列表
     * 
     * @param courseInfo 课程信息
     * @return 课程信息
     */
    @Override
    public List<CourseInfo> selectCourseInfoList(CourseInfo courseInfo)
    {
        return courseInfoMapper.selectCourseInfoList(courseInfo);
    }

    /**
     * 新增课程信息
     * 
     * @param courseInfo 课程信息
     * @return 结果
     */
    @Override
    public int insertCourseInfo(CourseInfo courseInfo)
    {
        return courseInfoMapper.insertCourseInfo(courseInfo);
    }

    /**
     * 修改课程信息
     * 
     * @param courseInfo 课程信息
     * @return 结果
     */
    @Override
    public int updateCourseInfo(CourseInfo courseInfo)
    {
        return courseInfoMapper.updateCourseInfo(courseInfo);
    }

    /**
     * 批量删除课程信息
     * 
     * @param ids 需要删除的课程信息主键
     * @return 结果
     */
    @Override
    public int deleteCourseInfoByIds(Long[] ids)
    {
        return courseInfoMapper.deleteCourseInfoByIds(ids);
    }

    /**
     * 删除课程信息信息
     * 
     * @param id 课程信息主键
     * @return 结果
     */
    @Override
    public int deleteCourseInfoById(Long id)
    {
        return courseInfoMapper.deleteCourseInfoById(id);
    }

    /**
     * 查询课程信息
     *
     * @param id 教师id
     * @return 课程信息
     */
    public List<CourseInfo> selectCourseInfoByTeacherId(Long id){
        return courseInfoMapper.selectCourseInfoByTeacherId(id);
    }

    /**
     * 批量导入信息
     *
     * @param courseList 课程信息集合
     * @param updateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    public String importCourse(List<CourseInfo> courseList, boolean updateSupport, String operName){
        if (StringUtils.isNull(courseList) || courseList.size() == 0)
        {
            throw new ServiceException("导入课程数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (CourseInfo course : courseList)
        {
            try
            {
                ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
                Validator validator = factory.getValidator();
                BeanValidators.validateWithException(validator, course);
                course.setCreateBy(operName);
                this.insertCourseInfo(course);
                successNum++;
                successMsg.append("<br/>" + successNum + "、课程 " + course.getName() + " 导入成功");

            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "、课程 " + course.getName() + " 导入失败：";
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
