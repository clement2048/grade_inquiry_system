import request from '@/utils/request'

// 查询班级信息列表
export function listClass(query) {
  return request({
    url: '/tm/Class/list',
    method: 'get',
    params: query
  })
}

// 查询班级信息详细
export function getClass(id) {
  return request({
    url: '/tm/Class/' + id,
    method: 'get'
  })
}

// 新增班级信息
export function addClass(data) {
  return request({
    url: '/tm/Class',
    method: 'post',
    data: data
  })
}

// 修改班级信息
export function updateClass(data) {
  return request({
    url: '/tm/Class',
    method: 'put',
    data: data
  })
}

// 删除班级信息
export function delClass(id) {
  return request({
    url: '/tm/Class/' + id,
    method: 'delete'
  })
}
