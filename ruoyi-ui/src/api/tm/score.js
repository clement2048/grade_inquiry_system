import request from '@/utils/request'

// 查询课程成绩列表
export function listScore(query) {
  return request({
    url: '/tm/score/list',
    method: 'get',
    params: query
  })
}

// 查询课程成绩详细
export function getScore(id) {
  return request({
    url: '/tm/score/' + id,
    method: 'get'
  })
}

// 新增课程成绩
export function addScore(data) {
  return request({
    url: '/tm/score',
    method: 'post',
    data: data
  })
}

// 修改课程成绩
export function updateScore(data) {
  return request({
    url: '/tm/score',
    method: 'put',
    data: data
  })
}

// 删除课程成绩
export function delScore(id) {
  return request({
    url: '/tm/score/' + id,
    method: 'delete'
  })
}

// 按照教师按照课程获取成绩
export function getScoreCourse(teacherId,courseId) {
  return request({
    url: '/tm/score/'+ teacherId+'/'+courseId,
    method: 'get'
  })
}

// 年级成绩分析
export function analysisScore(id) {
  return request({
    url: '/tm/score/Analysis/'+ id,
    method: 'get'
  })
}

// 返回不同年级和学期的成绩
export function getStuRank() {
  return request({
    url: '/tm/score/getYearAndSemScore',
    method: 'get'
  })
}
