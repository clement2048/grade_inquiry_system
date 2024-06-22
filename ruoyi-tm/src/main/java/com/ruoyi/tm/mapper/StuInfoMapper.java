package com.ruoyi.tm.mapper;

import java.util.List;
import com.ruoyi.tm.domain.StuInfo;
import org.apache.ibatis.annotations.Mapper;


/**
 * StudentMapper接口
 * 
 * @author clement
 * @date 2024-06-18
 */
@Mapper
public interface StuInfoMapper 
{
    /**
     * 查询Student
     * 
     * @param id Student主键
     * @return Student
     */
    public StuInfo selectStuInfoById(Long id);

    /**
     * 查询Student列表
     * 
     * @param stuInfo Student
     * @return Student集合
     */
    public List<StuInfo> selectStuInfoList(StuInfo stuInfo);

    /**
     * 新增Student
     * 
     * @param stuInfo Student
     * @return 结果
     */
    public int insertStuInfo(StuInfo stuInfo);

    /**
     * 修改Student
     * 
     * @param stuInfo Student
     * @return 结果
     */
    public int updateStuInfo(StuInfo stuInfo);


    /**
     * 删除Student
     * 
     * @param id Student主键
     * @return 结果
     */
    public int deleteStuInfoById(Long id);

    /**
     * 批量删除Student
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStuInfoByIds(Long[] ids);




}
