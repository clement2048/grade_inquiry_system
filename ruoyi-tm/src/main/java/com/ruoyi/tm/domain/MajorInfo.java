package com.ruoyi.tm.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 专业对象 major_info
 * 
 * @author clement
 * @date 2024-07-06
 */
public class MajorInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 专业id */
    @Excel(name = "专业id")
    private Long id;

    /** 专业名字 */
    @Excel(name = "专业名字")
    private String name;

    /** 专业开设时间 */
    @Excel(name = "专业开设时间")
    private Long dura;

    /** 所需专必学分 */
    @Excel(name = "所需专必学分")
    private Long majMust;

    /** 所需专选学分 */
    @Excel(name = "所需专选学分")
    private Long majChoose;

    /** 所需公必学分 */
    @Excel(name = "所需公必学分")
    private Long pubMust;

    /** 所需公选学分 */
    @Excel(name = "所需公选学分")
    private Long pubChoose;

    /** 毕业所需学分 */
    @Excel(name = "毕业所需学分")
    private Long graScore;

    /** 所属学院id */
    @Excel(name = "所属学院id")
    private Long facId;

    /** 专业内学生人数 */
    private Long peopleNum;

    /** 专业内老师数量 */
    private Long teacherNum;

    public Long getTeacherNum() {
		return teacherNum;
	}

    public void setTeacherNum(Long teacherNum) {
		this.teacherNum = teacherNum;
	}

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
    public void setDura(Long dura) 
    {
        this.dura = dura;
    }

    public Long getDura() 
    {
        return dura;
    }
    public void setMajMust(Long majMust) 
    {
        this.majMust = majMust;
    }

    public Long getMajMust() 
    {
        return majMust;
    }
    public void setMajChoose(Long majChoose) 
    {
        this.majChoose = majChoose;
    }

    public Long getMajChoose() 
    {
        return majChoose;
    }
    public void setPubMust(Long pubMust) 
    {
        this.pubMust = pubMust;
    }

    public Long getPubMust() 
    {
        return pubMust;
    }
    public void setPubChoose(Long pubChoose) 
    {
        this.pubChoose = pubChoose;
    }

    public Long getPubChoose() 
    {
        return pubChoose;
    }
    public void setGraScore(Long graScore) 
    {
        this.graScore = graScore;
    }

    public Long getGraScore() 
    {
        return graScore;
    }
    public void setFacId(Long facId) 
    {
        this.facId = facId;
    }

    public Long getFacId() 
    {
        return facId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("dura", getDura())
            .append("majMust", getMajMust())
            .append("majChoose", getMajChoose())
            .append("pubMust", getPubMust())
            .append("pubChoose", getPubChoose())
            .append("graScore", getGraScore())
            .append("facId", getFacId())
            .toString();
    }
}
