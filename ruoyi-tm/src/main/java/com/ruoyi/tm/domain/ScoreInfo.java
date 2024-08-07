package com.ruoyi.tm.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;


/**
 * 成绩管理对象 score_info
 * 
 * @author clement
 * @date 2024-06-21
 */
public class ScoreInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 成绩id */
    private Long id;

    /** 平时成绩占比 */
    @Excel(name = "平时成绩占比")
    private Long usualPor;

    /** 平时成绩 */
    @Excel(name = "平时成绩")
    private Long usualSco;

    /** 期中成绩占比 */
    @Excel(name = "期中成绩占比")
    private Long midPor;

    /** 期中成绩 */
    @Excel(name = "期中成绩")
    private Long midSco;

    /** 期末成绩占比 */
    @Excel(name = "期末成绩占比")
    private Long finalPor;

    /** 期末成绩 */
    @Excel(name = "期末成绩")
    private Long finalSco;

    /** 其他备注 */
    @Excel(name = "其他备注")
    private String others;

    /** 选课id */
    @Excel(name = "选课id")
    private Long chooseId;

    /** 课程id */
//    @Excel(name = "课程id")
    private Long courseId;

    /** 课程名 */
//    @Excel(name = "课程名")
    private String courseName;

    /** 学年 */
//    @Excel(name = "学年")
    private String year;

    /** 学期 */
//    @Excel(name = "学期")
    private String term;

    /** 是否挂科 */
//    @Excel(name = "是否挂科")
    private Long pass;

    /** 成绩排名 */
    private Long rank;

    /** 平均分 */
    private Long average;

    /** 学生id */
    private Long studentId;

    /** 学生名 */
    private String studentName;

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }


    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setAverage(Long average) {
        this.average = average;
    }

    public Long getAverage() {
        return average;
    }

    public void setRank(Long rank) {
        this.rank = rank;
    }

    public Long getRank() {
        return rank;
    }

    public void setPass(Long pass) {
        this.pass = pass;
    }

    public Long getPass() {
        return pass;
    }

    public void setTerm(String term) {
        this.term = term;
    }

    public String getTerm() {
        return term;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getYear() {
        return year;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUsualPor(Long usualPor) 
    {
        this.usualPor = usualPor;
    }

    public Long getUsualPor() 
    {
        return usualPor;
    }
    public void setUsualSco(Long usualSco) 
    {
        this.usualSco = usualSco;
    }

    public Long getUsualSco() 
    {
        return usualSco;
    }
    public void setMidPor(Long midPor) 
    {
        this.midPor = midPor;
    }

    public Long getMidPor() 
    {
        return midPor;
    }
    public void setMidSco(Long midSco) 
    {
        this.midSco = midSco;
    }

    public Long getMidSco() 
    {
        return midSco;
    }
    public void setFinalPor(Long finalPor) 
    {
        this.finalPor = finalPor;
    }

    public Long getFinalPor() 
    {
        return finalPor;
    }
    public void setFinalSco(Long finalSco) 
    {
        this.finalSco = finalSco;
    }

    public Long getFinalSco() 
    {
        return finalSco;
    }
    public void setOthers(String others) 
    {
        this.others = others;
    }

    public String getOthers() 
    {
        return others;
    }
    public void setChooseId(Long chooseId) 
    {
        this.chooseId = chooseId;
    }

    public Long getChooseId() 
    {
        return chooseId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("usualPor", getUsualPor())
            .append("usualSco", getUsualSco())
            .append("midPor", getMidPor())
            .append("midSco", getMidSco())
            .append("finalPor", getFinalPor())
            .append("finalSco", getFinalSco())
            .append("others", getOthers())
            .append("chooseId", getChooseId())
            .append("courseId",getCourseId())
            .append("courseName",getCourseName())
            .toString();
    }
}


