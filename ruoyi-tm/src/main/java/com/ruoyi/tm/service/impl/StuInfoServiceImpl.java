package com.ruoyi.tm.service.impl;

import java.util.List;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanValidators;
import com.ruoyi.tm.mapper.UserInfoMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.tm.mapper.StuInfoMapper;
import com.ruoyi.tm.domain.StuInfo;
import com.ruoyi.tm.service.IStuInfoService;

import javax.validation.Validator;

/**
 * StudentService业务层处理
 * 
 * @author clement
 * @date 2024-06-18
 */
//@Mapper
@Service
public class StuInfoServiceImpl implements IStuInfoService 
{
    @Autowired
    private StuInfoMapper stuInfoMapper;

    /**
     * 查询Student
     * 
     * @param id Student主键
     * @return Student
     */
    @Override
    public StuInfo selectStuInfoById(Long id)
    {
        return stuInfoMapper.selectStuInfoById(id);
    }

    /**
     * 查询Student列表
     * 
     * @param stuInfo Student
     * @return Student
     */
    @Override
    public List<StuInfo> selectStuInfoList(StuInfo stuInfo)
    {
        return stuInfoMapper.selectStuInfoList(stuInfo);
    }

    /**
     * 新增Student
     * 
     * @param stuInfo Student
     * @return 结果
     */
    @Override
    public int insertStuInfo(StuInfo stuInfo)
    {
        return stuInfoMapper.insertStuInfo(stuInfo);
    }

    /**
     * 修改Student
     * 
     * @param stuInfo Student
     * @return 结果
     */
    @Override
    public int updateStuInfo(StuInfo stuInfo)
    {
        return stuInfoMapper.updateStuInfo(stuInfo);
    }

    /**
     * 批量删除Student
     * 
     * @param ids 需要删除的Student主键
     * @return 结果
     */
    @Override
    public int deleteStuInfoByIds(Long[] ids)
    {
        return stuInfoMapper.deleteStuInfoByIds(ids);
    }

    /**
     * 删除Student信息
     * 
     * @param id Student主键
     * @return 结果
     */
    @Override
    public int deleteStuInfoById(Long id)
    {
        return stuInfoMapper.deleteStuInfoById(id);
    }

    @Override
    public String importUser(List<StuInfo> userList, boolean updateSupport, String operName) {
        if (StringUtils.isNull(userList) || userList.size() == 0)
        {
            throw new ServiceException("导入用户数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (StuInfo user : userList)
        {
            try
            {
                Validator validator = null;
                BeanValidators.validateWithException(validator, user);
                user.setCreateBy(operName);
                this.insertStuInfo(user);
                successNum++;
                successMsg.append("<br/>" + successNum + "、账号 " + user.getName() + " 导入成功");

            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "、账号 " + user.getName() + " 导入失败：";
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
}
