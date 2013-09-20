'use strict'

angular.module('dawnartApp')
  .controller 'NewStudentCtrl', ($scope, $routeParams) ->

    $scope.classNames = [
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

    $scope.newStudent = {
      age: 20
    }

    $scope.create = () ->
      student = $scope.newStudent
      student.from = $scope.selectedFroms()
      $scope.students.unshift student
      $scope.newStudent = {}
      $scope.addingNew = false

    $scope.save = () ->
      $scope.currentStudent.from = $scope.selectedFroms()
      $scope.editing = false

    $scope.selectedFroms = () ->
      _.pluck(_.where($scope.froms, { checked: true }), 'name')

    $scope.setSelectedFroms = (froms) ->
      _.each $scope.froms, (from) ->
        from.checked = _.include(froms, from.name)

