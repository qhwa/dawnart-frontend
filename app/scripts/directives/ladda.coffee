'use strict'

angular.module('Ladda', [])
  .directive 'ladda', () ->
    require:  '?ngModel',
    restrict: 'A',
    link: (scope, elem, attr, ctrl) ->

      elem.addClass( 'ladda-button' )
        .attr 'data-style', () ->
          attr.ladda || $(this).data('style') || 'expand-right'
        .prepend () ->
          $('<span/>').addClass( 'ladda-label' )

      l         = Ladda.create( elem[0] )
      indicator = attr.ngModel || 'loading'
      
      scope.$watch indicator, (newVal, oldVal) ->
        if typeof(newVal) != "undefined"
          if newVal
            l.start()
          else
            l.stop()
