package com.ruoyi.tm.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanValidators;
import com.ruoyi.system.mapper.SysUserMapper;
import com.ruoyi.system.service.impl.SysUserServiceImpl;
import com.ruoyi.tm.domain.UserInfo;
import com.ruoyi.tm.mapper.UserInfoMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.tm.mapper.StuInfoMapper;
import com.ruoyi.tm.domain.StuInfo;
import com.ruoyi.tm.service.IStuInfoService;
import org.springframework.transaction.annotation.Transactional;

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

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysUserServiceImpl sysUserService;

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
    @Transactional
    public int insertStuInfo(StuInfo stuInfo)
    {
        SysUser sysUser = new SysUser();
        sysUser.setDeptId(stuInfo.getMajorId());    // 设置专业id（目前未修改完成，在考虑是否将dept表修改为专业表）
        sysUser.setUserName(stuInfo.getName());    // 设置用户名
        sysUser.setNickName(stuInfo.getName());     // 给sys_user昵称赋值
        sysUser.setSex(stuInfo.getSex());   // 给用户性别赋值
        sysUser.setStatus("0"); // 默认状态正常
        sysUser.setDelFlag("0");    // 默认用户未删除
        sysUser.setRemark("学生");    // sys_user备注为学生
        sysUser.setPassword(stuInfo.getPassword());
        sysUser.setPassword(SecurityUtils.encryptPassword(sysUser.getPassword()));

        sysUserMapper.insertStuUser(sysUser);

        // 插入用户的对应角色，便于进行权限控制
        Long sid = (long)100;   // 100为学生权限编号
        Long[] roleIds = {sid};
        sysUserService.insertUserRole(sysUser.getUserId(), roleIds);

        stuInfo.setId(sysUser.getUserId());

        sysUser.setUserName(sysUser.getUserId().toString());
        sysUserMapper.updateUser(sysUser);

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
        return sysUserMapper.deleteUserByIds(ids);
//        return stuInfoMapper.deleteStuInfoByIds(ids);
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
//        stuInfoMapper.deleteStuInfoById(id);
        return sysUserMapper.deleteUserById(id);
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
                user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
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
