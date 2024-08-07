package com.ruoyi.tm.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 班级信息对象 class_info
 * 
 * @author ruoyi
 * @date 2024-07-08
 */
public class ClassInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 班级id */
    @Excel(name = "班级id")
    private Long id;

    /** 所在年级 */
    @Excel(name = "所在年级")
    private Long grade;

    /** 班主任id */
    @Excel(name = "班主任id")
    private Long teachId;

    /** 班主任姓名 */
    private String teacherName;

    /** 班号 */
    @Excel(name = "班号")
    private Long classNum;

    /** 成绩等级 */
    private String level;

    /** 成绩等级人数 */
    private String levelNum;

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getLevelNum() {
        return levelNum;
    }

    public void setLevelNum(String levelNum) {
        this.levelNum = levelNum;
    }


    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setGrade(Long grade) 
    {
        this.grade = grade;
    }

    public Long getGrade() 
    {
        return grade;
    }
    public void setTeachId(Long teachId) 
    {
        this.teachId = teachId;
    }

    public Long getTeachId() 
    {
        return teachId;
    }

    public void setClassNum(Long classNum) 
    {
        this.classNum = classNum;
    }

    public Long getClassNum() 
    {
        return classNum;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("grade", getGrade())
            .append("teachId", getTeachId())
            .append("teacherName", getTeacherName())
            .append("classNum", getClassNum())
            .toString();
    }
}
