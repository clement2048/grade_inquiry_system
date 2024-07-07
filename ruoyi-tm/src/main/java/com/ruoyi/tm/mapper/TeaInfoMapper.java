package com.ruoyi.tm.mapper;

import java.util.List;
import com.ruoyi.tm.domain.TeaInfo;
import org.apache.ibatis.annotations.Mapper;

/**
 * 教师信息Mapper接口
 * 
 * @author clement
 * @date 2024-07-06
 */
@Mapper
public interface TeaInfoMapper 
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
     * 删除教师信息
     * 
     * @param id 教师信息主键
     * @return 结果
     */
    public int deleteTeaInfoById(Long id);

    /**
     * 批量删除教师信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTeaInfoByIds(Long[] ids);
}
