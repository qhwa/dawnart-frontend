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

      succ = () ->
        $scope.attendances.splice index, 1
        $scope.students.push attd.student

      err = () ->
        console.log '删除失败'

      new Attendance(attd).$destroy succ, err

    $scope.activeClass = (expect, real) ->
      if expect == real
        'active'
      else
        ''
    $scope.chooseStudent = (index, scope) ->
      student = scope.student

      succ = (data) ->
        scope.loading = false
        if data.success
          $scope.students = _.without($scope.students, student)
          $scope.attendances.push data.attendance
          $scope.state = 'attendances'

      err = () ->
        console.log '添加失败'
        scope.loading = false

      scope.loading = true
      Attendances.create { student_id: student.id }, succ, err

    $scope.autoSave = (index) ->
      _attd = $scope.attendances[index]
      attd = new Attendance(_attd)
      attd.student_id = attd.student.id
      attd.$update (data) ->
        _attd.student = data.attendance.student


