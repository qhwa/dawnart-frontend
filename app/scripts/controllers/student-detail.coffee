'use strict'

angular.module('dawnartApp')
  .controller 'StudentDetailCtrl', ($scope, $routeParams, Student) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    $scope.student = new Student( id: $routeParams.id )
    $scope.student.$show()

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
