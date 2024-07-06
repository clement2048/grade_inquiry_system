package com.ruoyi.tm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.tm.mapper.MajorInfoMapper;
import com.ruoyi.tm.domain.MajorInfo;
import com.ruoyi.tm.service.IMajorInfoService;

/**
 * 专业Service业务层处理
 * 
 * @author clement
 * @date 2024-07-06
 */
@Service
public class MajorInfoServiceImpl implements IMajorInfoService 
{
    @Autowired
    private MajorInfoMapper majorInfoMapper;

    /**
     * 查询专业
     * 
     * @param id 专业主键
     * @return 专业
     */
    @Override
    public MajorInfo selectMajorInfoById(Long id)
    {
        return majorInfoMapper.selectMajorInfoById(id);
    }

    /**
     * 查询专业列表
     * 
     * @param majorInfo 专业
     * @return 专业
     */
    @Override
    public List<MajorInfo> selectMajorInfoList(MajorInfo majorInfo)
    {
        return majorInfoMapper.selectMajorInfoList(majorInfo);
    }

    /**
     * 新增专业
     * 
     * @param majorInfo 专业
     * @return 结果
     */
    @Override
    public int insertMajorInfo(MajorInfo majorInfo)
    {
        return majorInfoMapper.insertMajorInfo(majorInfo);
    }

    /**
     * 修改专业
     * 
     * @param majorInfo 专业
     * @return 结果
     */
    @Override
    public int updateMajorInfo(MajorInfo majorInfo)
    {
        return majorInfoMapper.updateMajorInfo(majorInfo);
    }

    /**
     * 批量删除专业
     * 
     * @param ids 需要删除的专业主键
     * @return 结果
     */
    @Override
    public int deleteMajorInfoByIds(Long[] ids)
    {
        return majorInfoMapper.deleteMajorInfoByIds(ids);
    }

    /**
     * 删除专业信息
     * 
     * @param id 专业主键
     * @return 结果
     */
    @Override
    public int deleteMajorInfoById(Long id)
    {
        return majorInfoMapper.deleteMajorInfoById(id);
    }
}
