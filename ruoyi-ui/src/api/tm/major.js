import request from '@/utils/request'

// 查询专业列表
export function listMajor(query) {
  return request({
    url: '/tm/major/list',
    method: 'get',
    params: query
  })
}

// 查询专业详细
export function getMajor(id) {
  return request({
    url: '/tm/major/' + id,
    method: 'get'
  })
}

// 新增专业
export function addMajor(data) {
  return request({
    url: '/tm/major',
    method: 'post',
    data: data
  })
}

// 修改专业
export function updateMajor(data) {
  return request({
    url: '/tm/major',
    method: 'put',
    data: data
  })
}

// 删除专业
export function delMajor(id) {
  return request({
    url: '/tm/major/' + id,
    method: 'delete'
  })
}
// 通过专业id获取专业内人数
export function getNumPeopleM(id) {
  return request({
    url: '/tm/major/getMajorPeoNum/' + id,
    method: 'get'
  })
}
// 通过学生id获取专业内人数
export function getNumPeopleS(id) {
  return request({
    url: '/tm/major/getMajorPeoNumByStuId/' + id,
    method: 'get'
  })
}
// 通过获取专业内学生人数
export function getPeoNum() {
  return request({
    url: '/tm/major/getPeoNum',
    method: 'get'
  })
}
// 通过获取专业内老师人数
export function getTeacherNum() {
  return request({
    url: '/tm/major/getTeacherNum' ,
    method: 'get'
  })
}
