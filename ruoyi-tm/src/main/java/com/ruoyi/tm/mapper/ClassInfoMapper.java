package com.ruoyi.tm.mapper;

import java.util.List;
import com.ruoyi.tm.domain.ClassInfo;
import org.apache.ibatis.annotations.Mapper;

/**
 * 班级信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-07-08
 */
@Mapper
public interface ClassInfoMapper 
{
    /**
     * 查询班级信息
     * 
     * @param id 班级信息主键
     * @return 班级信息
     */
    public ClassInfo selectClassInfoById(Long id);

    /**
     * 查询班级信息列表
     * 
     * @param classInfo 班级信息
     * @return 班级信息集合
     */
    public List<ClassInfo> selectClassInfoList(ClassInfo classInfo);

    /**
     * 新增班级信息
     * 
     * @param classInfo 班级信息
     * @return 结果
     */
    public int insertClassInfo(ClassInfo classInfo);

    /**
     * 新增带id的班级信息
     *
     * @param classInfo 班级信息
     * @return 结果
     */
    public int insertClassInfoWithId(ClassInfo classInfo);

    /**
     * 修改班级信息
     * 
     * @param classInfo 班级信息
     * @return 结果
     */
    public int updateClassInfo(ClassInfo classInfo);

    /**
     * 删除班级信息
     * 
     * @param id 班级信息主键
     * @return 结果
     */
    public int deleteClassInfoById(Long id);

    /**
     * 批量删除班级信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteClassInfoByIds(Long[] ids);

    /**
     * 班主任id查询班级信息
     *
     * @param id 班主任id
     * @return 结果
     */
    public ClassInfo selectClassByTeacherId(Long id);

    /**
     * 获取班级信息详细信息
     *
     * @return 结果
     */
    public List<ClassInfo> getClassScore();
}
