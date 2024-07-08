package com.ruoyi.tm.service;

import java.util.List;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.tm.domain.ChooseCourse;
import com.ruoyi.tm.domain.ClassInfo;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 选课Service接口
 * 
 * @author clement
 * @date 2024-07-06
 */
public interface IChooseCourseService 
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
     * 批量删除选课
     * 
     * @param ids 需要删除的选课主键集合
     * @return 结果
     */
    public int deleteChooseCourseByIds(Long[] ids);

    /**
     * 删除选课信息
     * 
     * @param id 选课主键
     * @return 结果
     */
    public int deleteChooseCourseById(Long id);

    /**
     * 批量导入选课信息
     *
     * @param chooseList 选课信息集合
     * @param updateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    public String importChoose(List<ChooseCourse> chooseList, boolean updateSupport, String operName);

    /**
     * 获取挂科数量
     */
    public ChooseCourse getNotPassNum();
}
