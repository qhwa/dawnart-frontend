'use strict'

# API provided by Ruby on Rails.
angular.module('AttendanceService', ['ngResource'])
  .factory 'Attendance', ($resource) ->
    $resource '/api/attendances/:id.json', { id: '@id' }, {
      show:   { method: 'GET' }
      update: { method: 'PUT' }
      destroy:{ method: 'DELETE' }
    }

  .factory 'Attendances', ($resource) ->
    $resource '/api/attendances.json', {}, {
      query:  { method: 'GET', isArray: true }
      create: { method: 'POST'}
    }
