'use strict'

angular.module('dawnartApp')
  .controller 'StudentDetailCtrl', ($scope, $routeParams, $http, Student, Comment, Comments) ->
    $scope.icon_types = [
      { slug: "usd", name: '学费' }
      { slug: "time", name: '请假' }
      { slug: "comment", name: '其他' }
    ]

    $scope.student = new Student( id: $routeParams.id )
    $scope.student.$show ()->
      $scope.course = $scope.student.course

    $scope.comments = Comments.query( student_id: $scope.student.id )
    $scope.newComment = {
      body: '',
      icon_type: 'comment'
    }

    $scope.addingComment = false

    $scope.addComment = () ->
      $scope.addingComment = true
      setTimeout( () ->
        $('textarea').focus()
      , 0)

    $scope.createComment = () ->
      $scope.creatingComment = true

      succ = (comment) ->
        $scope.newComment.body = ""
        $scope.comments.push comment
        $scope.creatingComment = false
        $scope.addingComment   = false

      err = () ->
        console.log '创建失败'
        $scope.creatingComment = false

      Comments.create { student_id: $scope.student.id }, $scope.newComment, succ, err

    $scope.rmComment = (index, evt, scope) ->
      scope.removing = true

      succ = () ->
        scope.removing = false
        $(evt.target).closest('.comment').slideUp () ->
          $scope.comments.splice( index, 1 )

      err = () ->
        scope.removing = false

      new Comment( id: $scope.comments[index].id, student_id: $scope.student.id ).$destroy succ, err

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

    $scope.chooseIcon = (index) ->
      $scope.newComment.icon_type = $scope.icon_types[index].slug
