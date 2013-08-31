'use strict'

describe 'Controller: StudentdetailCtrl', () ->

  # load the controller's module
  beforeEach module 'dawnartApp'

  StudentdetailCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    StudentdetailCtrl = $controller 'StudentdetailCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
