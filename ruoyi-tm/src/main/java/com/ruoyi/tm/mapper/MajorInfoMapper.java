package com.ruoyi.tm.mapper;

import java.util.List;
import com.ruoyi.tm.domain.MajorInfo;
import org.apache.ibatis.annotations.Mapper;

/**
 * 专业Mapper接口
 * 
 * @author clement
 * @date 2024-07-06
 */
@Mapper
public interface MajorInfoMapper 
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
     * 删除专业
     * 
     * @param id 专业主键
     * @return 结果
     */
    public int deleteMajorInfoById(Long id);

    /**
     * 批量删除专业
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMajorInfoByIds(Long[] ids);

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
}
