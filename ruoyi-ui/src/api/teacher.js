import request from '@/utils/request'

export function fetchTeacherSchedule() {
  return request({
    url: '/teacher/schedule',
    method: 'get'
  })
}

export function fetchChartData() {
  return request({
    url: '/teacher/chart-data',
    method: 'get'
  })
}
