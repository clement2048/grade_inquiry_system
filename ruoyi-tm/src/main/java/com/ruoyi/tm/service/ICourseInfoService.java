package com.ruoyi.tm.service;

import java.util.List;
import com.ruoyi.tm.domain.CourseInfo;
import com.ruoyi.tm.domain.MajorInfo;

/**
 * 课程信息Service接口
 * 
 * @author clement
 * @date 2024-07-07
 */
public interface ICourseInfoService 
{
    /**
     * 查询课程信息
     * 
     * @param id 课程信息主键
     * @return 课程信息
     */
    public CourseInfo selectCourseInfoById(Long id);

    /**
     * 查询课程信息列表
     * 
     * @param courseInfo 课程信息
     * @return 课程信息集合
     */
    public List<CourseInfo> selectCourseInfoList(CourseInfo courseInfo);

    /**
     * 新增课程信息
     * 
     * @param courseInfo 课程信息
     * @return 结果
     */
    public int insertCourseInfo(CourseInfo courseInfo);

    /**
     * 修改课程信息
     * 
     * @param courseInfo 课程信息
     * @return 结果
     */
    public int updateCourseInfo(CourseInfo courseInfo);

    /**
     * 批量删除课程信息
     * 
     * @param ids 需要删除的课程信息主键集合
     * @return 结果
     */
    public int deleteCourseInfoByIds(Long[] ids);

    /**
     * 删除课程信息信息
     * 
     * @param id 课程信息主键
     * @return 结果
     */
    public int deleteCourseInfoById(Long id);

    /**
     * 根据教师id查询课程信息
     *
     * @param id 教师id
     * @return 课程信息
     */
    public List<CourseInfo> selectCourseInfoByTeacherId(Long id);

    /**
     * 批量导入信息
     *
     * @param courseList 课程信息集合
     * @param updateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    public String importCourse(List<CourseInfo> courseList, boolean updateSupport, String operName);
}
