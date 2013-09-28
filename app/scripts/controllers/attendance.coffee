'use strict'

angular.module('dawnartApp')
  .controller 'AttendanceCtrl', ($scope, $http, Attendance, Attendances) ->

    $scope.state = 'attendance'

    $http.get( '/api/students/available.json')
      .success (students) ->
        $scope.students = students

    $scope.attendances = Attendances.query()

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

      attendance = {
        student_id: student.id
        student_name: student.name
        time:   '全天'
        class_content: '素描'
      }

      succ = () ->
        $scope.attendances.push attendance
        $scope.state = 'attendances'
        scope.loading = false

      err = () ->
        console.log '添加失败'
        scope.loading = false

      scope.loading = true
      Attendances.create attendance, succ, err


