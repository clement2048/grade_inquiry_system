import request from '@/utils/request'

// 查询用户信息列表
export function listUser(query) {
  return request({
    url: '/tm/user/list',
    method: 'get',
    params: query
  })
}

// 查询用户信息详细
export function getUser(id) {
  return request({
    url: '/tm/user/' + id,
    method: 'get'
  })
}

// 新增用户信息
export function addUser(data) {
  return request({
    url: '/tm/user',
    method: 'post',
    data: data
  })
}

// 修改用户信息
export function updateUser(data) {
  return request({
    url: '/tm/user',
    method: 'put',
    data: data
  })
}

// 删除用户信息
export function delUser(id) {
  return request({
    url: '/tm/user/' +id,
    method: 'delete',
    data: id
  })
}

export function data(id) {
  return request({
    url: '/tm/user/data/' +id,
    method: 'get'
  })
}
