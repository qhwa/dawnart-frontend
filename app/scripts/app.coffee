'use strict'

angular.module('dawnartApp', [
  'Ladda'
  'StudentService'
  'AttendanceService'
  'AuditsService'
  'CourseService'
  'FormatDateService'
  'CommentService'
])
  .config ($routeProvider) ->
    $routeProvider

      .when '/',
        templateUrl:    'views/main.html'
        controller:     'MainCtrl'
        key:            'home'

      .when '/students',
        templateUrl:    'views/students.html'
        controller:     'StudentCtrl'
        key:            'students'

      .when '/students/new',
        templateUrl:    'views/new-student.html'
        controller:     'NewStudentCtrl'
        key:            'students'

      .when '/students/:id',
        templateUrl:    'views/student.html'
        controller:     'StudentDetailCtrl'
        key:            'students'

      .when '/students/:id/edit',
        templateUrl:    'views/edit-student.html'
        controller:     'EditStudentCtrl'
        key:            'students'

      .when '/students/:student_id/audits',
        templateUrl:    'views/student-audits.html'
        controller:     'StudentAuditsCtrl'
        key:            'students'

      .when '/students/:student_id/courses/new',
        templateUrl:    'views/new-course.html'
        controller:     'CourseCtrl'
        key:            'students'

      .when '/attendance',
        templateUrl:    'views/attendance.html'
        controller:     'AttendanceCtrl'
        key:            'attendance'

      .otherwise
        redirectTo: '/'

  .config(['$httpProvider', ($httpProvider) ->
    $httpProvider.defaults.headers.common['X-CSRF-Token'] =
      $('meta[name=csrf-token]').attr('content')
  ])

  .run ($rootScope, $http, $route) ->
    $rootScope.$on '$routeChangeSuccess', (evt, route, prevRoute) ->
      pageKey = route.key
      $('.pagekey').toggleClass 'active', false
      $('.pagekey-' + pageKey).toggleClass 'active', true
