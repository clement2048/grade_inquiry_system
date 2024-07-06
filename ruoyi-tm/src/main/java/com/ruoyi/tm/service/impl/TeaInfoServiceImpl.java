package com.ruoyi.tm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.tm.mapper.TeaInfoMapper;
import com.ruoyi.tm.domain.TeaInfo;
import com.ruoyi.tm.service.ITeaInfoService;

/**
 * 教师信息Service业务层处理
 * 
 * @author clement
 * @date 2024-07-06
 */
@Service
public class TeaInfoServiceImpl implements ITeaInfoService 
{
    @Autowired
    private TeaInfoMapper teaInfoMapper;

    /**
     * 查询教师信息
     * 
     * @param id 教师信息主键
     * @return 教师信息
     */
    @Override
    public TeaInfo selectTeaInfoById(Long id)
    {
        return teaInfoMapper.selectTeaInfoById(id);
    }

    /**
     * 查询教师信息列表
     * 
     * @param teaInfo 教师信息
     * @return 教师信息
     */
    @Override
    public List<TeaInfo> selectTeaInfoList(TeaInfo teaInfo)
    {
        return teaInfoMapper.selectTeaInfoList(teaInfo);
    }

    /**
     * 新增教师信息
     * 
     * @param teaInfo 教师信息
     * @return 结果
     */
    @Override
    public int insertTeaInfo(TeaInfo teaInfo)
    {
        return teaInfoMapper.insertTeaInfo(teaInfo);
    }

    /**
     * 修改教师信息
     * 
     * @param teaInfo 教师信息
     * @return 结果
     */
    @Override
    public int updateTeaInfo(TeaInfo teaInfo)
    {
        return teaInfoMapper.updateTeaInfo(teaInfo);
    }

    /**
     * 批量删除教师信息
     * 
     * @param ids 需要删除的教师信息主键
     * @return 结果
     */
    @Override
    public int deleteTeaInfoByIds(Long[] ids)
    {
        return teaInfoMapper.deleteTeaInfoByIds(ids);
    }

    /**
     * 删除教师信息信息
     * 
     * @param id 教师信息主键
     * @return 结果
     */
    @Override
    public int deleteTeaInfoById(Long id)
    {
        return teaInfoMapper.deleteTeaInfoById(id);
    }
}
