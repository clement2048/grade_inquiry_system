package com.ruoyi.tm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.tm.mapper.ChooseCourseMapper;
import com.ruoyi.tm.domain.ChooseCourse;
import com.ruoyi.tm.service.IChooseCourseService;

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
}
