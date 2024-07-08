package com.ruoyi.tm.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.tm.service.IStuInfoService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.tm.domain.ClassInfo;
import com.ruoyi.tm.service.IClassInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 班级信息Controller
 * 
 * @author ruoyi
 * @date 2024-07-08
 */
@RestController
@RequestMapping("/tm/Class")
public class ClassInfoController extends BaseController
{
    @Autowired
    private IClassInfoService classInfoService;

    @Autowired
    private IStuInfoService stuInfoService;

    /**
     * 查询班级信息列表
     */
    @PreAuthorize("@ss.hasPermi('tm:Class:list')")
    @GetMapping("/list")
    public TableDataInfo list(ClassInfo classInfo)
    {
        startPage();
        List<ClassInfo> list = classInfoService.selectClassInfoList(classInfo);
        return getDataTable(list);
    }

    /**
     * 导出班级信息列表
     */
    @PreAuthorize("@ss.hasPermi('tm:Class:export')")
    @Log(title = "班级信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ClassInfo classInfo)
    {
        List<ClassInfo> list = classInfoService.selectClassInfoList(classInfo);
        ExcelUtil<ClassInfo> util = new ExcelUtil<ClassInfo>(ClassInfo.class);
        util.exportExcel(response, list, "班级信息数据");
    }

    /**
     * 获取班级信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('tm:Class:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(classInfoService.selectClassInfoById(id));
    }

    /**
     * 新增班级信息
     */
    @PreAuthorize("@ss.hasPermi('tm:Class:add')")
    @Log(title = "班级信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ClassInfo classInfo)
    {
        return toAjax(classInfoService.insertClassInfo(classInfo));
    }

    /**
     * 修改班级信息
     */
    @PreAuthorize("@ss.hasPermi('tm:Class:edit')")
    @Log(title = "班级信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ClassInfo classInfo)
    {
        return toAjax(classInfoService.updateClassInfo(classInfo));
    }

    /**
     * 删除班级信息
     */
    @PreAuthorize("@ss.hasPermi('tm:Class:remove')")
    @Log(title = "班级信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(classInfoService.deleteClassInfoByIds(ids));
    }

    /**
     * 通过班级id查询班级学生id
     */
    @PreAuthorize("@ss.hasPermi('tm:Class:query')")
    @GetMapping(value = "/getStudentByClassID/{id}")
    public AjaxResult getStudentByClassID(@PathVariable("id") Long id)
    {
        return success(stuInfoService.getStudentByClassID(id));
    }

    /**
     * 导入班级数据
     */
    @PreAuthorize("@ss.hasPermi('tm:Class:import')")
    @PostMapping("/importData")
    @ResponseBody
    public AjaxResult importClass(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<ClassInfo> util = new ExcelUtil<ClassInfo>(ClassInfo.class);
        List<ClassInfo> ClassList = util.importExcel(file.getInputStream());
        LoginUser loginUser = getLoginUser();
        String operName = loginUser.getUsername();
        String message = classInfoService.importClass(ClassList, updateSupport, operName);
        return AjaxResult.success(message);
    }

    /**
     * 获取班级信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('tm:Class:query')")
    @GetMapping(value = "/getClassScore")
    public AjaxResult getClassScore()
    {
        return success(classInfoService.getClassScore());
    }

}
