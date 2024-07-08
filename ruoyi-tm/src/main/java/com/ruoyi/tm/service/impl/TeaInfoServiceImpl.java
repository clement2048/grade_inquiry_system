package com.ruoyi.tm.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanValidators;
import com.ruoyi.system.mapper.SysUserMapper;
import com.ruoyi.system.service.impl.SysUserServiceImpl;
import com.ruoyi.tm.domain.CourseInfo;
import com.ruoyi.tm.domain.StuInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.tm.mapper.TeaInfoMapper;
import com.ruoyi.tm.domain.TeaInfo;
import com.ruoyi.tm.service.ITeaInfoService;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

/**
 * 教师信息Service业务层处理
 * 
 * @author clement
 * @date 2024-07-06
 */
@Service
public class TeaInfoServiceImpl implements ITeaInfoService {
    @Autowired
    private TeaInfoMapper teaInfoMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysUserServiceImpl sysUserService;

    /**
     * 查询教师信息
     *
     * @param id 教师信息主键
     * @return 教师信息
     */
    @Override
    public TeaInfo selectTeaInfoById(Long id) {
        return teaInfoMapper.selectTeaInfoById(id);
    }

    /**
     * 查询教师信息列表
     *
     * @param teaInfo 教师信息
     * @return 教师信息
     */
    @Override
    public List<TeaInfo> selectTeaInfoList(TeaInfo teaInfo) {
        return teaInfoMapper.selectTeaInfoList(teaInfo);
    }

    /**
     * 新增教师信息
     *
     * @param teaInfo 教师信息
     * @return 结果
     */
    @Override
    @Transactional
    public int insertTeaInfo(TeaInfo teaInfo) {
        SysUser sysUser = new SysUser();
        sysUser.setUserName(teaInfo.getName());    // 设置用户名
        sysUser.setNickName(teaInfo.getName());     // 给sys_user昵称赋值
        sysUser.setStatus("0"); // 默认状态正常
        sysUser.setDelFlag("0");    // 默认用户未删除
        sysUser.setRemark(teaInfo.getType());    // sys_user备注为学生

        sysUser.setPassword("123456");  // 默认密码为123456
        sysUser.setPassword(SecurityUtils.encryptPassword(sysUser.getPassword()));
        sysUserMapper.insertTeacherUser(sysUser);
        if (teaInfo.getType().equals("教师")) {
            // 插入用户的对应角色，便于进行权限控制
            Long sid = (long) 101;   // 101为教师权限编号
            Long[] roleIds = {sid};
            sysUserService.insertUserRole(sysUser.getUserId(), roleIds);
            teaInfo.setType("教师");
        } else if (teaInfo.getType().equals("教务老师")) {
            // 插入用户的对应角色，便于进行权限控制
            Long sid = (long) 102;   // 102为教务老师权限编号
            Long[] roleIds = {sid};
            sysUserService.insertUserRole(sysUser.getUserId(), roleIds);
            teaInfo.setType("教务老师");
        } else {
            // 插入用户的对应角色，便于进行权限控制
            Long sid = (long) 103;   // 103为班主任权限编号
            Long[] roleIds = {sid};
            sysUserService.insertUserRole(sysUser.getUserId(), roleIds);
            teaInfo.setType("班主任");
        }

        teaInfo.setId(sysUser.getUserId());
        return teaInfoMapper.insertTeaInfo(teaInfo);
    }

    /**
     * 修改教师信息
     *
     * @param teaInfo 教师信息
     * @return 结果
     */
    @Override
    public int updateTeaInfo(TeaInfo teaInfo) {

        return teaInfoMapper.updateTeaInfo(teaInfo);
    }

    /**
     * 批量删除教师信息
     *
     * @param ids 需要删除的教师信息主键
     * @return 结果
     */
    @Override
    public int deleteTeaInfoByIds(Long[] ids) {
        return teaInfoMapper.deleteTeaInfoByIds(ids);
    }

    /**
     * 删除教师信息信息
     *
     * @param id 教师信息主键
     * @return 结果
     */
    @Override
    public int deleteTeaInfoById(Long id) {
        // 保留原来的信息，只修改对应的del_flag
        return sysUserMapper.deleteUserById(id);
    }

    /**
     * 批量导入教师信息
     *
     * @param teaList       课程信息集合
     * @param updateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    @Override
    public String importTea(List<TeaInfo> teaList, boolean updateSupport, String operName) {
        if (StringUtils.isNull(teaList) || teaList.size() == 0)
        {
            throw new ServiceException("导入教师数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (TeaInfo teacher : teaList)
        {
            try
            {
                ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
                Validator validator = factory.getValidator();
                BeanValidators.validateWithException(validator, teacher);
                teacher.setCreateBy(operName);
                this.insertTeaInfo(teacher);
                successNum++;
                successMsg.append("<br/>" + successNum + "、教师 " + teacher.getName() + " 导入成功");

            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "、教师 " + teacher.getName() + " 导入失败：";
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
     * 根据教师id获取对应学生信息
     *
     * @param id 教师信息主键
     * @return 教师信息
     */
    public List<StuInfo> getStuInfo(Long id){
        return teaInfoMapper.getStuInfo(id);
    }
}

