'use strict'

angular.module('dawnartApp')
  .controller 'NewStudentCtrl', ($scope, $location, Student, Students) ->

    $scope.courseNames = [
      '全日制班',
      '周末班',
      '寒暑假班',
      '按次收费'
    ]

    $scope.purposes = [
      '业余爱好'
      '工作专业需要'
      '美术高考强化'
      '中考'
      '其他'
    ]

    $scope.froms = [
      { name: '他人推荐' }
      { name: '百度/谷歌' }
      { name: '58同城' }
      { name: '19楼' }
      { name: '其他互联网途径' }
      { name: '其他' }
    ]

    $scope.student = new Student
      age: 20
      purpose: '业余爱好'

    $scope.save = () ->

      $scope.student.from_list = _.pluck(
        _.where($scope.froms, { checked: true }),
        'name'
      )

      $scope.loading = true

      succ = (student) ->
        $scope.loading = false
        $location.path "/students/#{student.id}/courses/new"

      err = (data) ->
        $scope.loading = false

      new Students($scope.student).$create succ, err

    $scope.selectedFroms = () ->
