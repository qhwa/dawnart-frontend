'use strict'

# API provided by Ruby on Rails.
angular.module('CommentService', ['ngResource'])
  .factory 'Comment', ($resource) ->
    $resource '/api/students/:student_id/comments/:id.json', { id: '@id', student_id: '@student_id' }, {
      destroy: { method: 'DELETE' }
    }

  .factory 'Comments', ($resource) ->
    $resource '/api/students/:student_id/comments.json', {}, {
      query:  { method: 'GET', isArray: true },
      create: { method: 'POST' }
    }
