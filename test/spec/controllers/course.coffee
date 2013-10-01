'use strict'

describe 'Controller: CourseCtrl', () ->

  # load the controller's module
  beforeEach module 'dawnartApp'

  CourseCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    CourseCtrl = $controller 'CourseCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
