'use strict'

describe 'Service: student', () ->

  # load the service's module
  beforeEach module 'dawnartApp'

  # instantiate service
  student = {}
  beforeEach inject (_student_) ->
    student = _student_

  it 'should do something', () ->
    expect(!!student).toBe true
