'use strict'

angular.module('dawnartApp', [])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/students',
        templateUrl: 'views/students.html'
        controller: 'StudentCtrl'
      .otherwise
        redirectTo: '/'
