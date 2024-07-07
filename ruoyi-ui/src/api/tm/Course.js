import request from '@/utils/request'

// 查询课程信息列表
export function listCourse(query) {
  return request({
    url: '/tm/Course/list',
    method: 'get',
    params: query
  })
}

// 查询课程信息详细
export function getCourse(id) {
  return request({
    url: '/tm/Course/' + id,
    method: 'get'
  })
}

// 新增课程信息
export function addCourse(data) {
  return request({
    url: '/tm/Course',
    method: 'post',
    data: data
  })
}

// 修改课程信息
export function updateCourse(data) {
  return request({
    url: '/tm/Course',
    method: 'put',
    data: data
  })
}

// 删除课程信息
export function delCourse(id) {
  return request({
    url: '/tm/Course/' + id,
    method: 'delete'
  })
}
