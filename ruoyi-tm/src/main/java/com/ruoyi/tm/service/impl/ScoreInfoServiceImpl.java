package com.ruoyi.tm.service.impl;

import java.util.List;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanValidators;
import com.ruoyi.tm.domain.StuInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.tm.mapper.ScoreInfoMapper;
import com.ruoyi.tm.domain.ScoreInfo;
import com.ruoyi.tm.service.IScoreInfoService;

import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

/**
 * 成绩管理Service业务层处理
 * 
 * @author clement
 * @date 2024-06-21
 */
@Service
public class ScoreInfoServiceImpl implements IScoreInfoService 
{
    @Autowired
    private ScoreInfoMapper scoreInfoMapper;

    /**
     * 查询成绩管理
     * 
     * @param id 成绩管理主键
     * @return 成绩管理
     */
    @Override
    public ScoreInfo selectScoreInfoById(Long id)
    {
        return scoreInfoMapper.selectScoreInfoById(id);
    }

    /**
     * 查询成绩管理列表
     * 
     * @param scoreInfo 成绩管理
     * @return 成绩管理
     */
    @Override
    public List<ScoreInfo> selectScoreInfoList(ScoreInfo scoreInfo)
    {
        return scoreInfoMapper.selectScoreInfoList(scoreInfo);
    }

    /**
     * 新增成绩管理
     * 
     * @param scoreInfo 成绩管理
     * @return 结果
     */
    @Override
    public int insertScoreInfo(ScoreInfo scoreInfo)
    {
        return scoreInfoMapper.insertScoreInfo(scoreInfo);
    }

    /**
     * 修改成绩管理
     * 
     * @param scoreInfo 成绩管理
     * @return 结果
     */
    @Override
    public int updateScoreInfo(ScoreInfo scoreInfo)
    {
        return scoreInfoMapper.updateScoreInfo(scoreInfo);
    }

    /**
     * 批量删除成绩管理
     * 
     * @param ids 需要删除的成绩管理主键
     * @return 结果
     */
    @Override
    public int deleteScoreInfoByIds(Long[] ids)
    {
        return scoreInfoMapper.deleteScoreInfoByIds(ids);
    }

    /**
     * 删除成绩管理信息
     * 
     * @param id 成绩管理主键
     * @return 结果
     */
    @Override
    public int deleteScoreInfoById(Long id)
    {
        return scoreInfoMapper.deleteScoreInfoById(id);
    }

    /**
     * 通过课程获取成绩信息
     *
     * @param courseId 成绩管理主键
     * @return 结果
     */
    @Override
    public List<ScoreInfo> selectScoreInfoByCourseId(Long courseId){
        return scoreInfoMapper.selectScoreInfoByCourseId(courseId);
    }

    /**
     * 批量导入信息
     *
     * @param ScoreList 成绩信息集合
     * @param updateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    @Override
    public String importScore(List<ScoreInfo> ScoreList, boolean updateSupport,String operName) {
        if (StringUtils.isNull(ScoreList) || ScoreList.size() == 0)
        {
            throw new ServiceException("导入成绩数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (ScoreInfo score : ScoreList)
        {
            try
            {
//                Validator validator = null;
                ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
                Validator validator = factory.getValidator();
                BeanValidators.validateWithException(validator, score);
                score.setCreateBy(operName);
                this.insertScoreInfo(score);
                successNum++;
                successMsg.append("<br/>" + successNum + "、成绩id " + score.getId() + " 导入成功");

            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "、成绩id " + score.getId() + " 导入失败：";
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
