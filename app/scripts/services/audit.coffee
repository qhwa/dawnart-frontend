'use strict'

# API provided by Ruby on Rails.
angular.module('AuditsService', ['ngResource'])
  .factory 'Audits', ($resource) ->
    $resource '/api/students/:student_id/audits.json', {}, {
      query:  { method: 'GET', isArray: true }
    }
