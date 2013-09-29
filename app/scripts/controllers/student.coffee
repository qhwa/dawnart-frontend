'use strict'

angular.module('dawnartApp')
  .controller 'StudentCtrl', ($scope, $location, Students, Student) ->

    $scope.students = Students.query()

    $scope.gotoDetail = (scope) ->
      $location.path "/students/#{scope.student.id}"

    $scope.rm = (index, evt, scope) ->
      scope.loading = true
      student = $scope.students[index]

      succ = () ->
        scope.loading = false
        $scope.students.splice index, 1

      err = () ->
        scope.loading = false

      new Student(student).$destroy succ, err


    $scope.studentCount = 64
    $scope.currentPage = 4


