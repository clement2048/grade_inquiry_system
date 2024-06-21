package com.ruoyi.tm.service;

import java.util.List;
import com.ruoyi.tm.domain.ScoreInfo;

/**
 * 成绩管理Service接口
 * 
 * @author clement
 * @date 2024-06-21
 */
public interface IScoreInfoService 
{
    /**
     * 查询成绩管理
     * 
     * @param id 成绩管理主键
     * @return 成绩管理
     */
    public ScoreInfo selectScoreInfoById(Long id);

    /**
     * 查询成绩管理列表
     * 
     * @param scoreInfo 成绩管理
     * @return 成绩管理集合
     */
    public List<ScoreInfo> selectScoreInfoList(ScoreInfo scoreInfo);

    /**
     * 新增成绩管理
     * 
     * @param scoreInfo 成绩管理
     * @return 结果
     */
    public int insertScoreInfo(ScoreInfo scoreInfo);

    /**
     * 修改成绩管理
     * 
     * @param scoreInfo 成绩管理
     * @return 结果
     */
    public int updateScoreInfo(ScoreInfo scoreInfo);

    /**
     * 批量删除成绩管理
     * 
     * @param ids 需要删除的成绩管理主键集合
     * @return 结果
     */
    public int deleteScoreInfoByIds(Long[] ids);

    /**
     * 删除成绩管理信息
     * 
     * @param id 成绩管理主键
     * @return 结果
     */
    public int deleteScoreInfoById(Long id);
}
