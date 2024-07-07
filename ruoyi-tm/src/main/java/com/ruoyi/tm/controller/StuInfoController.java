package com.ruoyi.tm.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.model.LoginUser;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.tm.domain.StuInfo;
import com.ruoyi.tm.service.IStuInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * StudentController
 * 
 * @author clement
 * @date 2024-06-18
 */
@RestController
@RequestMapping("/system/info")
public class StuInfoController extends BaseController
{
    @Autowired
    private IStuInfoService stuInfoService;

    /**
     * 查询Student列表
     */
    @PreAuthorize("@ss.hasPermi('system:info:list')")
    @GetMapping("/list")
    public TableDataInfo list(StuInfo stuInfo)
    {
        startPage();
        List<StuInfo> list = stuInfoService.selectStuInfoList(stuInfo);
        return getDataTable(list);
    }

    /**
     * 导出Student列表
     */
    @PreAuthorize("@ss.hasPermi('system:info:export')")
    @Log(title = "Student", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, StuInfo stuInfo)
    {
        List<StuInfo> list = stuInfoService.selectStuInfoList(stuInfo);
        ExcelUtil<StuInfo> util = new ExcelUtil<StuInfo>(StuInfo.class);
        util.exportExcel(response, list, "Student数据");
    }

    /**
     * 获取Student详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(stuInfoService.selectStuInfoById(id));
    }

    /**
     * 新增Student
     */
    @PreAuthorize("@ss.hasPermi('system:info:add')")
    @Log(title = "Student", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody StuInfo stuInfo)
    {
        return toAjax(stuInfoService.insertStuInfo(stuInfo));
    }

    /**
     * 修改Student
     */
    @PreAuthorize("@ss.hasPermi('system:info:edit')")
    @Log(title = "Student", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody StuInfo stuInfo)
    {
        return toAjax(stuInfoService.updateStuInfo(stuInfo));
    }

    /**
     * 删除Student
     */
    @PreAuthorize("@ss.hasPermi('system:info:remove')")
    @Log(title = "Student", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(stuInfoService.deleteStuInfoByIds(ids));
    }


    /**
     * 导入Student数据
     */
    @PostMapping("/importData")
    @ResponseBody
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<StuInfo> util = new ExcelUtil<StuInfo>(StuInfo.class);
        List<StuInfo> userList = util.importExcel(file.getInputStream());
        LoginUser loginUser = getLoginUser();
        String operName = loginUser.getUsername();
        String message = stuInfoService.importUser(userList, updateSupport, operName);
        return AjaxResult.success(message);
    }

    @PostMapping("/importTemplate")
    public AjaxResult importTemplate()
    {
        ExcelUtil<StuInfo> util = new ExcelUtil<>(StuInfo.class);
        // sheetName可能有问题
        return util.importTemplateExcel("用户数据");
    }

    @GetMapping(value = "/StuIndex/{id}")
    public AjaxResult getStuAndCreditInfo(@PathVariable("id") Long id)
    {
        return success(stuInfoService.selectStuInfoAndCreditById(id));
    }
}
