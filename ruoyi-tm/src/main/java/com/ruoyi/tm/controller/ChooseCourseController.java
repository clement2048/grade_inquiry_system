package com.ruoyi.tm.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.tm.domain.ChooseCourse;
import com.ruoyi.tm.service.IChooseCourseService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 选课Controller
 * 
 * @author clement
 * @date 2024-07-06
 */
@RestController
@RequestMapping("/tm/choose")
public class ChooseCourseController extends BaseController
{
    @Autowired
    private IChooseCourseService chooseCourseService;

    /**
     * 查询选课列表
     */
    @PreAuthorize("@ss.hasPermi('tm:choose:list')")
    @GetMapping("/list")
    public TableDataInfo list(ChooseCourse chooseCourse)
    {
        startPage();
        List<ChooseCourse> list = chooseCourseService.selectChooseCourseList(chooseCourse);
        return getDataTable(list);
    }

    /**
     * 导出选课列表
     */
    @PreAuthorize("@ss.hasPermi('tm:choose:export')")
    @Log(title = "选课", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ChooseCourse chooseCourse)
    {
        List<ChooseCourse> list = chooseCourseService.selectChooseCourseList(chooseCourse);
        ExcelUtil<ChooseCourse> util = new ExcelUtil<ChooseCourse>(ChooseCourse.class);
        util.exportExcel(response, list, "选课数据");
    }

    /**
     * 获取选课详细信息
     */
    @PreAuthorize("@ss.hasPermi('tm:choose:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(chooseCourseService.selectChooseCourseById(id));
    }

    /**
     * 新增选课
     */
    @PreAuthorize("@ss.hasPermi('tm:choose:add')")
    @Log(title = "选课", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ChooseCourse chooseCourse)
    {
        return toAjax(chooseCourseService.insertChooseCourse(chooseCourse));
    }

    /**
     * 修改选课
     */
    @PreAuthorize("@ss.hasPermi('tm:choose:edit')")
    @Log(title = "选课", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ChooseCourse chooseCourse)
    {
        return toAjax(chooseCourseService.updateChooseCourse(chooseCourse));
    }

    /**
     * 删除选课
     */
    @PreAuthorize("@ss.hasPermi('tm:choose:remove')")
    @Log(title = "选课", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(chooseCourseService.deleteChooseCourseByIds(ids));
    }
}
