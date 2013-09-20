'use strict'

angular.module('dawnartApp')

  .controller 'EditStudentCtrl', ($scope, $routeParams, $location, Student) ->

    $scope.student = new Student( id: $routeParams.id )
    $scope.student.$show () ->
      $scope.setSelectedFroms( $scope.student.from_list )

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

    $scope.save = () ->
      $scope.saving = true

      succ = () ->
        $scope.saving = false
        $location.path '/students'

      err = () ->
        $scope.saving = false

      $scope.student.$update succ, err


    $scope.setSelectedFroms = (froms) ->
      _.each $scope.froms, (from) ->
        from.checked = _.include(froms, from.name)

    $scope.onChangeFrom = (scope) ->
      $scope.student.from_list = $scope.selectedFroms()

    $scope.selectedFroms = () ->
      _.pluck(_.where($scope.froms, { checked: true }), 'name')
