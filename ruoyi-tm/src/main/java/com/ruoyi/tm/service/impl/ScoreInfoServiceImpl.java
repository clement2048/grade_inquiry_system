package com.ruoyi.tm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.tm.mapper.ScoreInfoMapper;
import com.ruoyi.tm.domain.ScoreInfo;
import com.ruoyi.tm.service.IScoreInfoService;

/**
 * 成绩管理Service业务层处理
 * 
 * @author clement
 * @date 2024-06-21
 */
@Service
public class ScoreInfoServiceImpl implements IScoreInfoService 
{
    @Autowired
    private ScoreInfoMapper scoreInfoMapper;

    /**
     * 查询成绩管理
     * 
     * @param id 成绩管理主键
     * @return 成绩管理
     */
    @Override
    public ScoreInfo selectScoreInfoById(Long id)
    {
        return scoreInfoMapper.selectScoreInfoById(id);
    }

    /**
     * 查询成绩管理列表
     * 
     * @param scoreInfo 成绩管理
     * @return 成绩管理
     */
    @Override
    public List<ScoreInfo> selectScoreInfoList(ScoreInfo scoreInfo)
    {
        return scoreInfoMapper.selectScoreInfoList(scoreInfo);
    }

    /**
     * 新增成绩管理
     * 
     * @param scoreInfo 成绩管理
     * @return 结果
     */
    @Override
    public int insertScoreInfo(ScoreInfo scoreInfo)
    {
        return scoreInfoMapper.insertScoreInfo(scoreInfo);
    }

    /**
     * 修改成绩管理
     * 
     * @param scoreInfo 成绩管理
     * @return 结果
     */
    @Override
    public int updateScoreInfo(ScoreInfo scoreInfo)
    {
        return scoreInfoMapper.updateScoreInfo(scoreInfo);
    }

    /**
     * 批量删除成绩管理
     * 
     * @param ids 需要删除的成绩管理主键
     * @return 结果
     */
    @Override
    public int deleteScoreInfoByIds(Long[] ids)
    {
        return scoreInfoMapper.deleteScoreInfoByIds(ids);
    }

    /**
     * 删除成绩管理信息
     * 
     * @param id 成绩管理主键
     * @return 结果
     */
    @Override
    public int deleteScoreInfoById(Long id)
    {
        return scoreInfoMapper.deleteScoreInfoById(id);
    }
}
