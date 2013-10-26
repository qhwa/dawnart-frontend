'use strict'

angular.module('dawnartApp')
  .controller 'AttendanceCtrl', ($scope, $http, $location, $routeParams, Attendance, Attendances) ->

    $scope.date = moment($routeParams.date || undefined)

    dateStr = $scope.date.format('YYYY-MM-DD')

    $http.get( '/api/students/available.json?date=' + dateStr )
      .success (students) ->
        $scope.students = students
        $scope.studentsGroupByPinyin = _.groupBy $scope.students, (s) ->
          s.pinyin[0].toUpperCase()

    $http.get( '/api/attendances.json?date=' + dateStr )
      .success (attendances) ->
        $scope.attendances = attendances

    # 由于 resource 在这里有无法传递参数的bug，因此用 $http 实现
    #$scope.attendances = Attendances.query( { date: 'test' } )

    $scope.rm = (index) ->
      attd    = $scope.attendances[index]

      succ = (data) ->
        if data.success
          $scope.attendances.splice index, 1
          $scope.students.push attd.student
        else
          err(data)

      err = (data) ->
        console.log data
        console.log '删除失败'

      new Attendance(attd).$destroy succ, err

    $scope.activeClass = (expect, real, attd) ->
      if expect == real
        if attd.frozen
          'btn-info active'
        else
          'btn-default active'

    $scope.chooseStudent = (index, scope) ->
      student = scope.student

      succ = (data) ->
        scope.loading = false
        if data.success
          $scope.students = _.without($scope.students, student)
          $scope.attendances.push data.attendance

      err = () ->
        console.log '添加失败'
        scope.loading = false

      scope.loading = true
      Attendances.create { student_id: student.id, date: dateStr }, succ, err

    $scope.autoSave = (index) ->
      _attd = $scope.attendances[index]
      attd = new Attendance(_attd)
      attd.student_id = attd.student.id
      attd.$update (data) ->
        _.extend _attd, data.attendance


    $scope.prevDay = () ->
      date = $scope.date.add('d', -1)
      $scope.setDate date

    $scope.nextDay = () ->
      date = $scope.date.add('d', 1)
      $scope.setDate date

    $scope.setDate = (date) ->
      date = moment(date)
      $location.search "date", date.format('YYYY-MM-DD')

