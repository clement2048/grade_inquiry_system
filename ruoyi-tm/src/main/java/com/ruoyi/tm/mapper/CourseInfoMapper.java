package com.ruoyi.tm.mapper;

import java.util.List;
import com.ruoyi.tm.domain.CourseInfo;
import org.apache.ibatis.annotations.Mapper;

/**
 * 课程信息Mapper接口
 * 
 * @author clement
 * @date 2024-07-07
 */
@Mapper
public interface CourseInfoMapper 
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
     * 删除课程信息
     * 
     * @param id 课程信息主键
     * @return 结果
     */
    public int deleteCourseInfoById(Long id);

    /**
     * 批量删除课程信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCourseInfoByIds(Long[] ids);


    /**
     * 查询课程信息
     *
     * @param id 教师id
     * @return 课程信息
     */
    public List<CourseInfo> selectCourseInfoByTeacherId(Long id);
}
