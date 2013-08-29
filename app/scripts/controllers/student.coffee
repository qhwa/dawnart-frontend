'use strict'

angular.module('dawnartApp')
  .controller 'StudentCtrl', ($scope) ->

    $scope.students = [
      {
        name: "鸽子"
        pinyin: "gezi"
        age: "2"
        mobile: "15869103067"
        phone: ""
        class: "全日制班"
        purpose: "业余爱好"
        from: "他人推荐"
      },
      {
        name: "鸽子"
        pinyin: "gezi"
        age: "2"
        mobile: "15869103067"
        phone: ""
        class: "全日制班"
        purpose: "业余爱好"
        from: "他人推荐"
      }
    ]

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
      '他人推荐'
      '百度/谷歌'
      '58同城'
      '19楼'
      '其他互联网途径'
      '其他'
    ]

    $scope.addingNew = true

    $scope.create = () ->
      $scope.students.unshift $scope.newStudent
      $scope.newStudent = {}
      $scope.addingNew = false
