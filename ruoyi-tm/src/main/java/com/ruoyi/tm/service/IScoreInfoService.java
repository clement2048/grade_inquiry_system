package com.ruoyi.tm.service;

import java.util.List;

import com.ruoyi.tm.domain.Score;
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


    /**
     * 课程成绩查询
     *
     * @param courseId 课程id
     * @return 对应课程的集合
     */
    public List<ScoreInfo> selectScoreInfoByCourseId(Long courseId);

    /**
     * 批量导入信息
     *
     * @param ScoreList 成绩信息集合
     * @param updateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    public String importScore(List<ScoreInfo> ScoreList, boolean updateSupport,String operName);

    /**
     * 设置排名信息
     *
     * @param ScoreList 成绩信息集合
     * @param updateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */


    /**
     * 教务老师获取成绩详细信息
     *
     * @param id 教务老师
     * @return 结果
     */
    public List<ScoreInfo> selectScoreInfoByMTeacherId(Long id);


    /**
     * 教务老师获取平均成绩信息
     *
     * @param id 教务老师
     * @return 结果
     */
    public List<ScoreInfo> selectAvgScoreInfoByMTeacherId(Long id);

    /**
     * 老师获取教过的课程的详细成绩信息
     *
     * @param id 老师id
     * @return 结果
     */
    public List<ScoreInfo> selectScoreInfoByTeacherId(Long id);

    /**
     * 老师获取挂科名单
     *
     * @param id 老师id
     * @return 结果
     */
    public List<ScoreInfo> selectUnPassByTeacherId(Long id);


    /**
     * 根据班级获取成绩
     *
     * @param id 班级id
     * @return 结果
     */
    public List<ScoreInfo> selectScoreByClassId(Long id);

    /**
     * 根据学生id获取绩点
     *
     * @param id 班级id
     * @return 结果
     */
    public ScoreInfo getStuScoreByStuId(Long id);

}
