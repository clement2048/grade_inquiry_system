package com.ruoyi.tm.service;

import java.util.List;
import com.ruoyi.tm.domain.TeaInfo;

/**
 * 教师信息Service接口
 * 
 * @author clement
 * @date 2024-07-06
 */
public interface ITeaInfoService 
{
    /**
     * 查询教师信息
     * 
     * @param id 教师信息主键
     * @return 教师信息
     */
    public TeaInfo selectTeaInfoById(Long id);

    /**
     * 查询教师信息列表
     * 
     * @param teaInfo 教师信息
     * @return 教师信息集合
     */
    public List<TeaInfo> selectTeaInfoList(TeaInfo teaInfo);

    /**
     * 新增教师信息
     * 
     * @param teaInfo 教师信息
     * @return 结果
     */
    public int insertTeaInfo(TeaInfo teaInfo);

    /**
     * 修改教师信息
     * 
     * @param teaInfo 教师信息
     * @return 结果
     */
    public int updateTeaInfo(TeaInfo teaInfo);

    /**
     * 批量删除教师信息
     * 
     * @param ids 需要删除的教师信息主键集合
     * @return 结果
     */
    public int deleteTeaInfoByIds(Long[] ids);

    /**
     * 删除教师信息信息
     * 
     * @param id 教师信息主键
     * @return 结果
     */
    public int deleteTeaInfoById(Long id);
}
