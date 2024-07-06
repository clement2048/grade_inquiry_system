package com.ruoyi.tm.mapper;

import java.util.List;
import com.ruoyi.tm.domain.ScoreInfo;
import org.springframework.stereotype.Service;

/**
 * 成绩管理Mapper接口
 * 
 * @author clement
 * @date 2024-06-21
 */
@Service
public interface ScoreInfoMapper 
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
     * 删除成绩管理
     * 
     * @param id 成绩管理主键
     * @return 结果
     */
    public int deleteScoreInfoById(Long id);

    /**
     * 批量删除成绩管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteScoreInfoByIds(Long[] ids);


    /**
     * 根据课程id查询成绩
     *
     * @param courseId 课程id
     * @return 结果
     */
    public List<ScoreInfo> selectScoreInfoByCourseId(Long courseId);


    /**
     * 根据教务老师id查询成绩
     *
     * @param id 课程id
     * @return 结果
     */
    public List<ScoreInfo>selectScoreInfoByMTeacherId(Long id);
}
