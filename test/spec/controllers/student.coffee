'use strict'

describe 'Controller: StudentCtrl', () ->

  # load the controller's module
  beforeEach module 'dawnartApp'

  StudentCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    StudentCtrl = $controller 'StudentCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
