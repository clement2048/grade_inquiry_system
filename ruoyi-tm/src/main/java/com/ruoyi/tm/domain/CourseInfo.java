package com.ruoyi.tm.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 课程信息对象 course_info
 * 
 * @author clement
 * @date 2024-07-07
 */
public class CourseInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 课程id */
    private Long id;

    /** 课程名字 */
    @Excel(name = "课程名字")
    private String name;

    /** 课程类型 */
    @Excel(name = "课程类型")
    private String type;

    /** 人数限制 */
    @Excel(name = "人数限制")
    private Long peoLimit;

    /** 学分 */
    @Excel(name = "学分")
    private Long credit;

    /** 总学时 */
    @Excel(name = "总学时")
    private Long totTime;

    /** 期末考试方法 */
    @Excel(name = "期末考试方法")
    private String finalMethod;

    /** 开办学年 */
    @Excel(name = "开办学年")
    private Long startYear;

    /** 开办学期 */
    @Excel(name = "开办学期")
    private Long startSem;

    /** 开办学院id */
    @Excel(name = "开办学院id")
    private Long facId;

    /** 授课老师id */
    @Excel(name = "授课老师id")
    private Long teachId;

    /** 当前选课人数*/
    private Long peopleNum;

    public Long getPeopleNum() {
		return peopleNum;
	}

    public void setPeopleNum(Long peopleNum) {
		this.peopleNum = peopleNum;
	}

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setPeoLimit(Long peoLimit) 
    {
        this.peoLimit = peoLimit;
    }

    public Long getPeoLimit() 
    {
        return peoLimit;
    }
    public void setCredit(Long credit) 
    {
        this.credit = credit;
    }

    public Long getCredit() 
    {
        return credit;
    }
    public void setTotTime(Long totTime) 
    {
        this.totTime = totTime;
    }

    public Long getTotTime() 
    {
        return totTime;
    }
    public void setFinalMethod(String finalMethod) 
    {
        this.finalMethod = finalMethod;
    }

    public String getFinalMethod() 
    {
        return finalMethod;
    }
    public void setStartYear(Long startYear) 
    {
        this.startYear = startYear;
    }

    public Long getStartYear() 
    {
        return startYear;
    }
    public void setStartSem(Long startSem) 
    {
        this.startSem = startSem;
    }

    public Long getStartSem() 
    {
        return startSem;
    }
    public void setFacId(Long facId) 
    {
        this.facId = facId;
    }

    public Long getFacId() 
    {
        return facId;
    }
    public void setTeachId(Long teachId) 
    {
        this.teachId = teachId;
    }

    public Long getTeachId() 
    {
        return teachId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("type", getType())
            .append("peoLimit", getPeoLimit())
            .append("credit", getCredit())
            .append("totTime", getTotTime())
            .append("finalMethod", getFinalMethod())
            .append("startYear", getStartYear())
            .append("startSem", getStartSem())
            .append("facId", getFacId())
            .append("teachId", getTeachId())
            .toString();
    }
}
