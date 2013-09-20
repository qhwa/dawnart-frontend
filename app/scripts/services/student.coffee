'use strict'

# API provided by Ruby on Rails.
angular.module('StudentService', ['ngResource'])
  .factory 'Student', ($resource) ->
    $resource '/api/students/:id.json', { id: '@id' }, {
      show:   { method: 'GET' }
      update: { method: 'PUT' }
      destroy:{ method: 'DELETE' }
    }

  .factory 'Students', ($resource) ->
    $resource '/api/students.json', {}, {
      query:  { method: 'GET', isArray: true }
      create: { method: 'POST'}
    }

