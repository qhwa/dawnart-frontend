'use strict'

angular.module('dawnartApp')
  .controller 'StudentAuditsCtrl', ($scope) ->

    $scope.audits = [
      {
        date: '2013-08-01'
        type: '报名'
        change: 20
        snapshot: {
          time_used: 0, time_total: 20, time_left: 20
        }
      }
      {
        date: '2013-08-01'
        type: '上课'
        change: -1.0
        attendance: {
          id: 1
          date: '2013-08-01'
          time: '全天'
          course_content: '素描'
        }
        snapshot: {
          time_used: 1.0, time_total: 20, time_left: 19.0
        }
      }
      {
        date: '2013-08-02'
        type: '上课'
        change: -0.5
        attendance: {
          id: 1
          date: '2013-08-02'
          time: '上午'
          course_content: '素描'
        }
        snapshot: {
          time_used: 1.5, time_total: 20, time_left: 18.5
        }
      }
      {
        date: '2013-10-02'
        type: '结课'
        change: -18.5
        snapshot: {
          time_used: 0, time_total: 20, time_left: 0
        }
      }
    ]

    $scope.describe = (audit) ->
      switch audit.type
        when '上课'
          attd = audit.attendance
          "#{attd.time} / #{attd.course_content}"
        when '结课'
          "超时结课"
        else audit.type
