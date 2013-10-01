angular.module('FormatDateService',[]).filter 'date', () ->
  (date) ->
    moment(date).format('L dddd')
