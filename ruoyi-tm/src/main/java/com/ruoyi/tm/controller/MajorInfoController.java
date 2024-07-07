package com.ruoyi.tm.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.tm.domain.StuInfo;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.tm.domain.MajorInfo;
import com.ruoyi.tm.service.IMajorInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 专业Controller
 * 
 * @author clement
 * @date 2024-07-06
 */
@RestController
@RequestMapping("/tm/major")
public class MajorInfoController extends BaseController
{
    @Autowired
    private IMajorInfoService majorInfoService;

    /**
     * 查询专业列表
     */
    @PreAuthorize("@ss.hasPermi('tm:major:list')")
    @GetMapping("/list")
    public TableDataInfo list(MajorInfo majorInfo)
    {
        startPage();
        List<MajorInfo> list = majorInfoService.selectMajorInfoList(majorInfo);
        return getDataTable(list);
    }

    /**
     * 导出专业列表
     */
    @PreAuthorize("@ss.hasPermi('tm:major:export')")
    @Log(title = "专业", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MajorInfo majorInfo)
    {
        List<MajorInfo> list = majorInfoService.selectMajorInfoList(majorInfo);
        ExcelUtil<MajorInfo> util = new ExcelUtil<MajorInfo>(MajorInfo.class);
        util.exportExcel(response, list, "专业数据");
    }

    /**
     * 获取专业详细信息
     */
    @PreAuthorize("@ss.hasPermi('tm:major:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(majorInfoService.selectMajorInfoById(id));
    }

    /**
     * 新增专业
     */
    @PreAuthorize("@ss.hasPermi('tm:major:add')")
    @Log(title = "专业", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MajorInfo majorInfo)
    {
        return toAjax(majorInfoService.insertMajorInfo(majorInfo));
    }

    /**
     * 修改专业
     */
    @PreAuthorize("@ss.hasPermi('tm:major:edit')")
    @Log(title = "专业", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MajorInfo majorInfo)
    {
        return toAjax(majorInfoService.updateMajorInfo(majorInfo));
    }

    /**
     * 删除专业
     */
    @PreAuthorize("@ss.hasPermi('tm:major:remove')")
    @Log(title = "专业", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(majorInfoService.deleteMajorInfoByIds(ids));
    }

    /**
     * 通过专业id获取专业内人数
     */
    @GetMapping(value = "/getMajorPeoNum/{id}")
    public AjaxResult getMajorPeopleNum(@PathVariable("id") Long id)
    {
        return success(majorInfoService.getMajorPeopleNumById(id));
    }

    /**
     * 通过学生id获取专业内人数
     */
    @GetMapping(value = "/getMajorPeoNumByStuId/{id}")
    public AjaxResult getMajorPeoNumByStuId(@PathVariable("id") Long id)
    {
        return success(majorInfoService.getMajorPeoNumByStuId(id));
    }

    /**
     * 导入Major
     */
    @PostMapping("/importData")
    @ResponseBody
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<MajorInfo> util = new ExcelUtil<MajorInfo>(MajorInfo.class);
        List<MajorInfo> majorList = util.importExcel(file.getInputStream());
        LoginUser loginUser = getLoginUser();
        String operName = loginUser.getUsername();
        String message = majorInfoService.importMajor(majorList, updateSupport, operName);
        return AjaxResult.success(message);
    }

    /**
     * 通过获取专业内学生人数
     */
    @GetMapping(value = "/getPeoNum")
    public AjaxResult getPeoNum()
    {
        return success(majorInfoService.getPeoNum());
    }

    /**
     * 通过获取专业内老师人数
     */
    @GetMapping(value = "/getTeacherNum")
    public AjaxResult getTeacherNum()
    {
        return success(majorInfoService.getTeacherNum());
    }
}
