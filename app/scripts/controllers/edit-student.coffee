'use strict'

angular.module('dawnartApp')

  .controller 'EditStudentCtrl', ($scope, $routeParams) ->

    $scope.student =
      id:       1
      name:     "鸽子"
      pinyin:   "gezi"
      age:      2
      mobile:   "15869103067"
      phone:    ""
      class:    "全日制班"
      purpose:  "业余爱好"
      from:     ["他人推荐"]

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

    $scope.save = () ->
      $scope.student.from = $scope.selectedFroms()

    $scope.selectedFroms = () ->
      _.pluck(_.where($scope.froms, { checked: true }), 'name')

    $scope.setSelectedFroms = (froms) ->
      _.each $scope.froms, (from) ->
        from.checked = _.include(froms, from.name)

    $scope.setSelectedFroms( $scope.student.from )
