import request from '@/utils/request'

// 查询班级管理列表
export function listClass_info(query) {
  return request({
    url: '/class/class_info/list',
    method: 'get',
    params: query
  })
}

// 查询班级管理详细
export function getClass_info(id) {
  return request({
    url: '/class/class_info/' + id,
    method: 'get'
  })
}

// 新增班级管理
export function addClass_info(data) {
  return request({
    url: '/class/class_info',
    method: 'post',
    data: data
  })
}

// 修改班级管理
export function updateClass_info(data) {
  return request({
    url: '/class/class_info',
    method: 'put',
    data: data
  })
}

// 删除班级管理
export function delClass_info(id) {
  return request({
    url: '/class/class_info/' + id,
    method: 'delete'
  })
}
