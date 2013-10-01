'use strict'

describe 'Service: currentStudent', () ->

  # load the service's module
  beforeEach module 'dawnartApp'

  # instantiate service
  currentStudent = {}
  beforeEach inject (_currentStudent_) ->
    currentStudent = _currentStudent_

  it 'should do something', () ->
    expect(!!currentStudent).toBe true
