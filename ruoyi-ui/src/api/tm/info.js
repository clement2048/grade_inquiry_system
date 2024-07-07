import request from '@/utils/request'

// 查询Student列表
export function listInfo(query) {
  return request({
    url: '/system/info/list',
    method: 'get',
    params: query
  })
}

// 查询Student详细
export function getInfo(id) {
  return request({
    url: '/system/info/' + id,
    method: 'get'
  })
}

// 新增Student
export function addInfo(data) {
  return request({
    url: '/system/info',
    method: 'post',
    data: data
  })
}

// 修改Student
export function updateInfo(data) {
  return request({
    url: '/system/info',
    method: 'put',
    data: data
  })
}

// 删除Student
export function delInfo(id) {
  return request({
    url: '/system/info/' + id,
    method: 'delete'
  })
}
// 获取学生学分
export function getCreditInfo(id) {
  return request({
    url: '/system/info/StuIndex/' + id,
    method: 'get'
  })
}
// 获取总绩点
// export function getGPA(id) {
//   return request({
//     url: '/system/info/StuScore/' + id,
//     method: 'get'
//   })
// }
// 根据学生id获取平均分
export function getAvgScore(id) {
  return request({
    url: '/system/info/StuAvgScore/' + id,
    method: 'get'
  })
}
// 根据学生id获取成绩详情
export function getScoreInfo(id) {
  return request({
    url: '/system/info/StuScoreInfo/' + id,
    method: 'get'
  })
}
// 根据学生id以及总绩点计算专业内排名
export function getScoreRank(id) {
  return request({
    url: '/system/info/StuScoreANDMRank/' + id,
    method: 'get'
  })
}
