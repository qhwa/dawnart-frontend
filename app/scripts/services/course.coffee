'use strict'

# API provided by Ruby on Rails.
angular.module('CourseService', ['ngResource'])
  .factory 'Courses', ($resource) ->
    $resource '/api/students/:student_id/courses.json', { student_id: '@student_id' }, {
      query:  { method: 'GET', isArray: true }
      create: { method: 'POST'}
    }
