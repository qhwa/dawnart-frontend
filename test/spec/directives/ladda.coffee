'use strict'

describe 'Directive: ladda', () ->

  # load the directive's module
  beforeEach module 'dawnartApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<ladda></ladda>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the ladda directive'
