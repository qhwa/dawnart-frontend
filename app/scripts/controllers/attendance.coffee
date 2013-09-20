'use strict'

angular.module('dawnartApp')
  .controller 'AttendanceCtrl', ($scope) ->

    $scope.state = 'attendance'

    $scope.students = [
      { id: 1,  name: '朱鸽子',   time_total: 12,  time_used: 2,  time_left: 10, attended: true }
      { id: 2,  name: '邱华',     time_total: 24,  time_used: 19, time_left: 5,  attended: true }
      { id: 3,  name: '如彼',     time_total: 24,  time_used: 19, time_left: 5,  attended: false }
      { id: 4,  name: '朱鸽子2',  time_total: 12,  time_used: 2,  time_left: 10, attended: false }
      { id: 5,  name: '朱鸽子3',  time_total: 12,  time_used: 2,  time_left: 10, attended: false }
      { id: 6,  name: '朱鸽子4',  time_total: 12,  time_used: 2,  time_left: 10, attended: false }
    ]

    $scope.availableStudents = () ->
      _.where $scope.students, attended: false

    $scope.attendances = [
      {
        student_id: 1
        student_name: '朱鸽子'
        time:     '全天'
        class_content: '色彩'
        info:     ''
      }
      {
        student_id: 2
        student_name: '邱华'
        time:     '全天'
        class_content: '色彩'
        info:     ''
      }

    ]

    $scope.rm = (index) ->
      attd    = $scope.attendances[index]
      student = _.findWhere $scope.students, { id: attd.student_id }
      student.attended = false
      $scope.attendances.splice index, 1

    $scope.activeClass = (expect, real) ->
      if expect == real
        'active'
      else
        ''

    $scope.chooseStudent = (index, scope) ->
      student = scope.student
      student.attended = true
      $scope.state = 'attendances'

      $scope.attendances.push {
        student_id: student.id
        student_name: student.name
        time:   '全天'
        class_content: '素描'
        info:   ''
      }


