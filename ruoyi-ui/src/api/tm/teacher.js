import request from '@/utils/request'

// 查询教师信息列表
export function listTeacher(query) {
  return request({
    url: '/tm/teacher/list',
    method: 'get',
    params: query
  })
}

// 查询教师信息详细
export function getTeacher(id) {
  return request({
    url: '/tm/teacher/' + id,
    method: 'get'
  })
}

// 新增教师信息
export function addTeacher(data) {
  return request({
    url: '/tm/teacher',
    method: 'post',
    data: data
  })
}

// 修改教师信息
export function updateTeacher(data) {
  return request({
    url: '/tm/teacher',
    method: 'put',
    data: data
  })
}

// 删除教师信息
export function delTeacher(id) {
  return request({
    url: '/tm/teacher/' + id,
    method: 'delete'
  })
}

// 获取教师课程信息
export function getCourseInfo(teacherId) {
  return request({
    url: `/tm/teacher/getCourse/` + teacherId,
    method: 'get'
  });
}
export function getClassInfo(teacherId) {
  return request({
    url: `/tm/teacher/getClass/` + teacherId,
    method: 'get'
  });
}
export function getStuInfo(teacherId) {
  return request({
    url: `/tm/teacher/getStuScoreInfo/` + teacherId,
    method: 'get'
  });
}
export function getScoreInfoBycId(Id) {
  return request({
    url: `/tm/Course/StudentScore/` + Id,
    method: 'get'
  });
}
export function getStuScoreInfoByStuId(Id) {
  return request({
    url: `/system/info//StuScoreInfo` +Id,
    method: 'get'
  });
}

export function getScoreByCourse(teacherId, courseId) {
  return request({
    url: `/tm/score/${teacherId}/${courseId}`,
    method: 'get'
  });
}
