'use strict'

angular.module('dawnartApp')
  .controller 'StudentCtrl', ($scope, Students, Student) ->

    $scope.students = Students.query()

    $scope.rm = (index, scope) ->
      scope.loading = true
      student = $scope.students[index]

      succ = () ->
        scope.loading = false
        $scope.students.splice index, 1

      err = () ->
        scope.loading = false

      new Student(student).$destroy succ, err

