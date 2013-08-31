'use strict'

angular.module('dawnartApp', [])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        key: 'home'
      .when '/students',
        templateUrl: 'views/students.html'
        controller: 'StudentCtrl'
        key: 'students'
      .otherwise
        redirectTo: '/'

  .run ($rootScope, $http, $route) ->
    $rootScope.$on '$routeChangeSuccess', (evt, route, prevRoute) ->
      pageKey = route.key
      $('.pagekey').toggleClass 'active', false
      $('.pagekey-' + pageKey).toggleClass 'active', true
