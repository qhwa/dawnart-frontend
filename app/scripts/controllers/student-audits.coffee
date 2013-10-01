'use strict'

angular.module('dawnartApp')
  .controller 'StudentAuditsCtrl', ($scope, $routeParams, Audits) ->

    Audits.query { student_id: $routeParams.id }, (audits) ->
      timeTotal = 0
      timeUsed  = 0
      timeLeft  = 0

      _.each audits, (audit) ->
        change = audit.change
        timeUsed -= change if audit.type == '上课'
        timeLeft += change
        audit.snapshot = {
          timeUsed: timeUsed
          timeLeft: timeLeft
        }

      $scope.audits = audits

    $scope.describe = (audit) ->
      switch audit.type
        when '上课'
          attd = audit.auditable
          "#{attd.time} / #{attd.course_content || '--'}"
        when '结课'
          "超时结课"
        else audit.type
