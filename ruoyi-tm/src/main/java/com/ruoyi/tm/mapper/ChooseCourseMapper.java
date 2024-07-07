package com.ruoyi.tm.mapper;

import java.util.List;
import com.ruoyi.tm.domain.ChooseCourse;
import org.apache.ibatis.annotations.Mapper;

/**
 * 选课Mapper接口
 * 
 * @author clement
 * @date 2024-07-06
 */
@Mapper
public interface ChooseCourseMapper 
{
    /**
     * 查询选课
     * 
     * @param id 选课主键
     * @return 选课
     */
    public ChooseCourse selectChooseCourseById(Long id);

    /**
     * 查询选课列表
     * 
     * @param chooseCourse 选课
     * @return 选课集合
     */
    public List<ChooseCourse> selectChooseCourseList(ChooseCourse chooseCourse);

    /**
     * 新增选课
     * 
     * @param chooseCourse 选课
     * @return 结果
     */
    public int insertChooseCourse(ChooseCourse chooseCourse);

    /**
     * 修改选课
     * 
     * @param chooseCourse 选课
     * @return 结果
     */
    public int updateChooseCourse(ChooseCourse chooseCourse);

    /**
     * 删除选课
     * 
     * @param id 选课主键
     * @return 结果
     */
    public int deleteChooseCourseById(Long id);

    /**
     * 批量删除选课
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteChooseCourseByIds(Long[] ids);
}
