'use strict'

angular.module('dawnartApp')
  .service 'CurrentStudent', () ->

    student = {}

    {
      set: (stu) ->
        student = stu

      get: () ->
        student
    }
