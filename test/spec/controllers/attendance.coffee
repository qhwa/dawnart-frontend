'use strict'

describe 'Controller: AttendanceCtrl', () ->

  # load the controller's module
  beforeEach module 'dawnartApp'

  AttendanceCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AttendanceCtrl = $controller 'AttendanceCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
