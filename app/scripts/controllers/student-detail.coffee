'use strict'

angular.module('dawnartApp')
  .controller 'StudentDetailCtrl', ($scope, $routeParams, $http, Student) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    $scope.student = new Student( id: $routeParams.id )
    $scope.student.$show ()->
      $scope.course = $scope.student.course

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

    $scope.clearTime = () ->
      $scope.clearing = true
      if confirm "确认要将#{$scope.student.name}的课时清零吗？该操作不可恢复!"
        succ = (response) ->
          $scope.clearing = false
          $scope.student = new Student(response.data)

        err = () ->
          $scope.clearing = false

        $http.put( "/api/students/#{$scope.student.id}/clear_time.json" ).then succ, err
      else
        $scope.clearing = false
