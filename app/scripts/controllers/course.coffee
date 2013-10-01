'use strict'

angular.module('dawnartApp')
  .controller 'CourseCtrl', ($scope, $routeParams, $location, Courses) ->

    $scope.course = {
      student_id: $routeParams.student_id
    }

    $scope.coursePresets = [

      {
        name:   '周末一天班'
        presets: [
          { months: 3,  time: 12,   price: 1800 }
          { months: 6,  time: 24,   price: 3300 }
          { months: 12, time: 48,   price: 6000 }
        ]
      }

      {
        name: '周末两天班'
        presets: [
          { months: 3,  time: 24,   price: 3300 }
          { months: 6,  time: 48,   price: 6000 }
          { months: 12, time: 96,   price: 10800 }
        ]
      }

      {
        name: '平时半天班'
        presets: [
          { months: 3,  time: 33,   price: 4000 }
          { months: 6,  time: 66,   price: 12700 }
          { months: 12, time: 132,  price: 14000 }
        ]
      }

      {
        name: '平时全天班'
        presets: [
          { months: 1,  time: 24,   price: 3000 }
          { months: 3,  time: 72,   price: 7200 }
          { months: 6,  time: 144,  price: 12700 }
          { months: 12, time: 288,  price: 22000 }
        ]
      }

      {
        name: '寒暑假半天班'
        presets: [
          { months: 1,  time: 12,   price: 2000 }
          { months: 2,  time: 24,   price: 3600 }
        ]
      }

      {
        name: '寒暑假全天班'
        presets: [
          { months: 1,  time: 24,   price: 3300 }
          { months: 2,  time: 48,   price: 6000 }
        ]
      }

      {
        name: '按次收费（半天）'
        presets: [
          { months: 6, time: 10,   price: 2000 }
        ]
      }

      {
        name: '按次收费（全天）'
        presets: [
          { months: 6, time: 20,   price: 3600 }
        ]
      }

    ]

    $scope.applyPreset = (name, preset) ->
      $scope.course.name    = name
      $scope.course.months  = preset.months
      $scope.course.time    = preset.time
      $scope.course.price   = preset.price

    $scope.save = (data) ->
      $scope.loading = true
      succ = () ->
        $scope.loading = false
        $location.path "/students/#{$scope.course.student_id}"

      err = () ->
        $scope.loading = false

      Courses.create( $scope.course, succ, err )

