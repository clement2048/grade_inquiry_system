package com.ruoyi.tm.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.tm.domain.CourseInfo;
import com.ruoyi.tm.service.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.tm.domain.TeaInfo;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

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

    @Autowired
    private IClassInfoService classInfoService;

    @Autowired
    private IScoreInfoService scoreInfoService;


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

    /**
     * 根据班主任id获取对应班级信息
     */
    @GetMapping(value = "/getClass/{id}")
    public AjaxResult getClassInfo(@PathVariable("id") Long id)
    {
        return success(classInfoService.selectClassByTeacherId(id));
    }

    /**
     * 导入Teacher
     */
    @PreAuthorize("@ss.hasPermi('tm:teacher:import')")
    @PostMapping("/importData")
    @ResponseBody
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<TeaInfo> util = new ExcelUtil<TeaInfo>(TeaInfo.class);
        List<TeaInfo> teaList = util.importExcel(file.getInputStream());
        LoginUser loginUser = getLoginUser();
        String operName = loginUser.getUsername();
        String message = teaInfoService.importTea(teaList, updateSupport, operName);
        return AjaxResult.success(message);
    }


    /**
     * 根据教师id获取学生信息
     */
    @PreAuthorize("@ss.hasPermi('tm:teacher:query')")
    @GetMapping(value = "/getStuInfo/{id}")
    public AjaxResult getStuInfo(@PathVariable("id") Long id)
    {
        return success(teaInfoService.getStuInfo(id));
    }

    /**
     * 根据教师id获取学生成绩信息
     */
    @PreAuthorize("@ss.hasPermi('tm:teacher:query')")
    @GetMapping(value = "/getStuScoreInfo/{id}")
    public AjaxResult getStuScoreInfo(@PathVariable("id") Long id)
    {
        return success(scoreInfoService.getStuScoreInfo(id));
    }


    /**
     * 根据教师id获取课程成绩信息
     */
    @PreAuthorize("@ss.hasPermi('tm:teacher:query')")
    @GetMapping(value = "/getCourseScoreInfo/{id}")
    public AjaxResult getCourseScoreInfo(@PathVariable("id") Long id)
    {
        return success(scoreInfoService.getCourseScoreInfo(id));
    }
}
