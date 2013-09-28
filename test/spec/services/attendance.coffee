'use strict'

describe 'Service: attendance', () ->

  # load the service's module
  beforeEach module 'dawnartApp'

  # instantiate service
  attendance = {}
  beforeEach inject (_attendance_) ->
    attendance = _attendance_

  it 'should do something', () ->
    expect(!!attendance).toBe true
