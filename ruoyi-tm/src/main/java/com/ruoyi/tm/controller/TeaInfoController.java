package com.ruoyi.tm.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.tm.service.ICourseInfoService;
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
import com.ruoyi.tm.domain.TeaInfo;
import com.ruoyi.tm.service.ITeaInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 教师信息Controller
 * 
 * @author clement
 * @date 2024-07-06
 */
@RestController
@RequestMapping("/tm/teacher")
public class TeaInfoController extends BaseController
{
    @Autowired
    private ITeaInfoService teaInfoService;

    @Autowired
    private ICourseInfoService courseInfoService;

    /**
     * 查询教师信息列表
     */
    @PreAuthorize("@ss.hasPermi('tm:teacher:list')")
    @GetMapping("/list")
    public TableDataInfo list(TeaInfo teaInfo)
    {
        startPage();
        List<TeaInfo> list = teaInfoService.selectTeaInfoList(teaInfo);
        return getDataTable(list);
    }

    /**
     * 导出教师信息列表
     */
    @PreAuthorize("@ss.hasPermi('tm:teacher:export')")
    @Log(title = "教师信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TeaInfo teaInfo)
    {
        List<TeaInfo> list = teaInfoService.selectTeaInfoList(teaInfo);
        ExcelUtil<TeaInfo> util = new ExcelUtil<TeaInfo>(TeaInfo.class);
        util.exportExcel(response, list, "教师信息数据");
    }

    /**
     * 获取教师信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('tm:teacher:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(teaInfoService.selectTeaInfoById(id));
    }

    /**
     * 新增教师信息
     */
    @PreAuthorize("@ss.hasPermi('tm:teacher:add')")
    @Log(title = "教师信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TeaInfo teaInfo)
    {
        return toAjax(teaInfoService.insertTeaInfo(teaInfo));
    }

    /**
     * 修改教师信息
     */
    @PreAuthorize("@ss.hasPermi('tm:teacher:edit')")
    @Log(title = "教师信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TeaInfo teaInfo)
    {
        return toAjax(teaInfoService.updateTeaInfo(teaInfo));
    }

    /**
     * 删除教师信息
     */
    @PreAuthorize("@ss.hasPermi('tm:teacher:remove')")
    @Log(title = "教师信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(teaInfoService.deleteTeaInfoByIds(ids));
    }


    /**
     * 根据教师id获取课程信息
     */
    @PreAuthorize("@ss.hasPermi('tm:teacher:query')")
    @GetMapping(value = "/getCourse/{id}")
    public AjaxResult getCourseInfo(@PathVariable("id") Long id)
    {
        return success(courseInfoService.selectCourseInfoByTeacherId(id));
    }

}
