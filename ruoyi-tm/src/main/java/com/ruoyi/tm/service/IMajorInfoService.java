package com.ruoyi.tm.service;

import java.util.List;
import com.ruoyi.tm.domain.MajorInfo;
import com.ruoyi.tm.domain.StuInfo;

/**
 * 专业Service接口
 * 
 * @author clement
 * @date 2024-07-06
 */
public interface IMajorInfoService 
{
    /**
     * 查询专业
     * 
     * @param id 专业主键
     * @return 专业
     */
    public MajorInfo selectMajorInfoById(Long id);

    /**
     * 查询专业列表
     * 
     * @param majorInfo 专业
     * @return 专业集合
     */
    public List<MajorInfo> selectMajorInfoList(MajorInfo majorInfo);

    /**
     * 新增专业
     * 
     * @param majorInfo 专业
     * @return 结果
     */
    public int insertMajorInfo(MajorInfo majorInfo);

    /**
     * 修改专业
     * 
     * @param majorInfo 专业
     * @return 结果
     */
    public int updateMajorInfo(MajorInfo majorInfo);

    /**
     * 批量删除专业
     * 
     * @param ids 需要删除的专业主键集合
     * @return 结果
     */
    public int deleteMajorInfoByIds(Long[] ids);

    /**
     * 删除专业信息
     * 
     * @param id 专业主键
     * @return 结果
     */
    public int deleteMajorInfoById(Long id);

    /**
     * 通过专业id获取专业内人数
     * @param id 专业主键
     * @return 结果
     */
    public MajorInfo getMajorPeopleNumById(Long id);

    /**
     * 通过学生id获取专业内人数
     * @param id 学生主键
     * @return 结果
     */
    public MajorInfo getMajorPeoNumByStuId(Long id);

    /**
     * 批量导入信息
     *
     * @param majorList 专业信息集合
     * @param updateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    public String importMajor(List<MajorInfo> majorList, boolean updateSupport, String operName);

    /**
     * 获取专业内学生人数
     * @return 结果
     */
    public MajorInfo getPeoNum();
}
