'use strict'

describe 'Service: comments', () ->

  # load the service's module
  beforeEach module 'dawnartApp'

  # instantiate service
  comments = {}
  beforeEach inject (_comments_) ->
    comments = _comments_

  it 'should do something', () ->
    expect(!!comments).toBe true
