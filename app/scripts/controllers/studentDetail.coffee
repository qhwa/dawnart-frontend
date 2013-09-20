'use strict'

angular.module('dawnartApp')
  .controller 'StudentDetailCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    $scope.student =
      id:             1
      name:           "鸽子"
      pinyin:         "gezi"
      age: 2
      mobile:         "15869103067"
      phone:          ""
      class:          "全日制班"
      purpose:        "业余爱好"
      from:           ["他人推荐"]
      time_total:     90
      time_used:      30
      time_left:      60
      progress:       '33.33%'
      registed_on:    '2013-08-01'
      begin_on:       '2013-08-01'
      need_finish_on: '2013-10-01'

    $scope.comments = [
      { body: '付款成功', created_by: 'system', created_at: '2013-08-01', icon_type: 'usd' }
      { body: '请假1天',  created_by: 'system', created_at: '2013-08-27', icon_type: 'comment' }
    ]

    $scope.addComment = () ->
      $scope.addingComment = true
      setTimeout( () ->
        $('textarea').focus()
      , 0)

    $scope.createComment = () ->
      $scope.comments.push
        body: $scope.newComment.body
        created_by: 'user'
        created_at: new Date()
        icon_type: 'comment'

      $scope.newComment.body = ""
      $scope.addingComment = false

    $scope.rmComment = (index) ->
      $scope.comments.splice( index, 1 )
