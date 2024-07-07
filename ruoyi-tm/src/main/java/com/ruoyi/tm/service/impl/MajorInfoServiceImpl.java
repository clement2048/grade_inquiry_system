package com.ruoyi.tm.service.impl;

import java.util.List;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanValidators;
import com.ruoyi.tm.domain.StuInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.tm.mapper.MajorInfoMapper;
import com.ruoyi.tm.domain.MajorInfo;
import com.ruoyi.tm.service.IMajorInfoService;

import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

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

    /**
     * 通过专业id获取专业内人数
     * @param id 专业主键
     * @return 结果
     */
    @Override
    public MajorInfo getMajorPeopleNumById(Long id){
        return majorInfoMapper.getMajorPeopleNumById(id);
    }

    /**
     * 通过学生id获取专业内人数
     * @param id 学生主键
     * @return 结果
     */
    @Override
    public MajorInfo getMajorPeoNumByStuId(Long id){
        return majorInfoMapper.getMajorPeoNumByStuId(id);
    }


    /**
     * 批量导入信息
     *
     * @param majorList 专业信息集合
     * @param updateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    @Override
    public String importMajor(List<MajorInfo> majorList ,boolean updateSupport, String operName) {
        if (StringUtils.isNull(majorList) || majorList.size() == 0)
        {
            throw new ServiceException("导入专业数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (MajorInfo major : majorList)
        {
            try
            {
                ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
                Validator validator = factory.getValidator();
                BeanValidators.validateWithException(validator, major);
                major.setCreateBy(operName);
                this.insertMajorInfo(major);
                successNum++;
                successMsg.append("<br/>" + successNum + "、专业 " + major.getName() + " 导入成功");

            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "、专业 " + major.getName() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
            }
        }
        if (failureNum > 0)
        {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        }
        else
        {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }

    /**
     * 获取专业内学生人数
     * @return 结果
     */
    public MajorInfo getPeoNum(){
        return majorInfoMapper.getPeoNum();
    }
}

