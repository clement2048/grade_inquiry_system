package com.ruoyi.tm.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.tm.service.IScoreInfoService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.tm.domain.CourseInfo;
import com.ruoyi.tm.service.ICourseInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 课程信息Controller
 * 
 * @author clement
 * @date 2024-07-07
 */
@RestController
@RequestMapping("/tm/Course")
public class CourseInfoController extends BaseController
{
    @Autowired
    private ICourseInfoService courseInfoService;

    @Autowired
    private IScoreInfoService scoreInfoService;

    /**
     * 查询课程信息列表
     */
    @PreAuthorize("@ss.hasPermi('tm:Course:list')")
    @GetMapping("/list")
    public TableDataInfo list(CourseInfo courseInfo)
    {
        startPage();
        List<CourseInfo> list = courseInfoService.selectCourseInfoList(courseInfo);
        return getDataTable(list);
    }

    /**
     * 导出课程信息列表
     */
    @PreAuthorize("@ss.hasPermi('tm:Course:export')")
    @Log(title = "课程信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CourseInfo courseInfo)
    {
        List<CourseInfo> list = courseInfoService.selectCourseInfoList(courseInfo);
        ExcelUtil<CourseInfo> util = new ExcelUtil<CourseInfo>(CourseInfo.class);
        util.exportExcel(response, list, "课程信息数据");
    }

    /**
     * 获取课程信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('tm:Course:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(courseInfoService.selectCourseInfoById(id));
    }

    /**
     * 新增课程信息
     */
    @PreAuthorize("@ss.hasPermi('tm:Course:add')")
    @Log(title = "课程信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CourseInfo courseInfo)
    {
        return toAjax(courseInfoService.insertCourseInfo(courseInfo));
    }

    /**
     * 修改课程信息
     */
    @PreAuthorize("@ss.hasPermi('tm:Course:edit')")
    @Log(title = "课程信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CourseInfo courseInfo)
    {
        return toAjax(courseInfoService.updateCourseInfo(courseInfo));
    }

    /**
     * 删除课程信息
     */
    @PreAuthorize("@ss.hasPermi('tm:Course:remove')")
    @Log(title = "课程信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(courseInfoService.deleteCourseInfoByIds(ids));
    }


    /**
     * 获取参与课程的学生的成绩信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('tm:Course:query')")
    @GetMapping(value = "/StudentScore/{id}")
    public AjaxResult getScoreInfoByCourseId(@PathVariable("id") Long id)
    {
        return success(scoreInfoService.getScoreInfoByCourseId(id));
    }
}
