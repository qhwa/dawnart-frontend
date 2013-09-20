'use strict'

angular.module('dawnartApp')
  .controller 'StudentCtrl', ($scope) ->

    $scope.students = [
      {
        id: 1
        name: "鸽子"
        pinyin: "gezi"
        age: 2
        mobile: "15869103067"
        phone: ""
        class: "全日制班"
        purpose: "业余爱好"
        from: ["他人推荐"]
      },
      {
        id: 2
        name: "朱朱"
        pinyin: "gezi"
        age: 2
        mobile: "15869103067"
        phone: ""
        class: "全日制班"
        purpose: "业余爱好"
        from: ["他人推荐"]
      }
    ]

    $scope.rm = (index) ->
      $scope.students.splice(index, 1)

