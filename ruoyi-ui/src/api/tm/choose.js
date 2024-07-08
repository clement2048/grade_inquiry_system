import request from '@/utils/request'

// 查询选课列表
export function listChoose(query) {
  return request({
    url: '/tm/choose/list',
    method: 'get',
    params: query
  })
}

// 查询选课详细
export function getChoose(id) {
  return request({
    url: '/tm/choose/' + id,
    method: 'get'
  })
}

// 新增选课
export function addChoose(data) {
  return request({
    url: '/tm/choose',
    method: 'post',
    data: data
  })
}

// 修改选课
export function updateChoose(data) {
  return request({
    url: '/tm/choose',
    method: 'put',
    data: data
  })
}

// 删除选课
export function delChoose(id) {
  return request({
    url: '/tm/choose/' + id,
    method: 'delete'
  })
}

// 获取挂科数量
export function getPassNum() {
  return request({
    url: '/tm/choose/getNotPassNum',
    method: 'get'
  })
}
