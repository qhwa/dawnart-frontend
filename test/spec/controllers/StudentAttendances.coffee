'use strict'

describe 'Controller: StudentattendancesCtrl', () ->

  # load the controller's module
  beforeEach module 'dawnartApp'

  StudentattendancesCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    StudentattendancesCtrl = $controller 'StudentattendancesCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
