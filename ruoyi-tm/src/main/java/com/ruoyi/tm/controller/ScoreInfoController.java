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
import com.ruoyi.tm.domain.ScoreInfo;
import com.ruoyi.tm.service.IScoreInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 成绩管理Controller
 * 
 * @author clement
 * @date 2024-06-21
 */
@RestController
@RequestMapping("/tm/score")
public class ScoreInfoController extends BaseController
{
    @Autowired
    private IScoreInfoService scoreInfoService;

    /**
     * 查询成绩管理列表
     */
    @PreAuthorize("@ss.hasPermi('tm:score:list')")
    @GetMapping("/list")
    public TableDataInfo list(ScoreInfo scoreInfo)
    {
        startPage();
        List<ScoreInfo> list = scoreInfoService.selectScoreInfoList(scoreInfo);
        return getDataTable(list);
    }

    /**
     * 导出成绩管理列表
     */
    @PreAuthorize("@ss.hasPermi('tm:score:export')")
    @Log(title = "成绩管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ScoreInfo scoreInfo)
    {
        List<ScoreInfo> list = scoreInfoService.selectScoreInfoList(scoreInfo);
        ExcelUtil<ScoreInfo> util = new ExcelUtil<ScoreInfo>(ScoreInfo.class);
        util.exportExcel(response, list, "成绩管理数据");
    }

    /**
     * 获取成绩管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('tm:score:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(scoreInfoService.selectScoreInfoById(id));
    }

    /**
     * 新增成绩管理
     */
    @PreAuthorize("@ss.hasPermi('tm:score:add')")
    @Log(title = "成绩管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ScoreInfo scoreInfo)
    {
        return toAjax(scoreInfoService.insertScoreInfo(scoreInfo));
    }

    /**
     * 修改成绩管理
     */
    @PreAuthorize("@ss.hasPermi('tm:score:edit')")
    @Log(title = "成绩管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ScoreInfo scoreInfo)
    {
        return toAjax(scoreInfoService.updateScoreInfo(scoreInfo));
    }

    /**
     * 删除成绩管理
     */
    @PreAuthorize("@ss.hasPermi('tm:score:remove')")
    @Log(title = "成绩管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(scoreInfoService.deleteScoreInfoByIds(ids));
    }
}
