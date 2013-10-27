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


    $scope.filters = [
      {
        name: '课程已过期',
        filter: (s) ->
          if s.course && s.course.need_finish_on
            moment(s.course.need_finish_on).isBefore()
      },

      {
        name: '课程即将过期',
        filter: (s) ->
          if s.course && s.course.need_finish_on
            m = moment(s.course.need_finish_on)
            m.isAfter() && m.isBefore( moment().add(7,'days') )
      }
    ]

    $scope.currentFilter = null
    $scope.studentsCount = ( filter ) ->
      _.filter( $scope.students, filter.filter ).length

    $scope.getActiveClass = (scope) ->
      current = $scope.currentFilter
      if scope.filter == current || !scope.filter && !current
        'active'

    $scope.filterBy = ( scope, evt ) ->
      evt.preventDefault()
      $scope.currentFilter = scope.filter

