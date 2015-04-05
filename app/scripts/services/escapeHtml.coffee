'use strict'

###*
 # @ngdoc service
 # @name seaspongeApp.EscapeHtml
 # @description
 # # EscapeHtml
 # Factory in the seaspongeApp.
###
angular.module('seaspongeApp')
    .factory('EscapeHtml', [ ->

        entityMap = {
            "&": "&amp;",
            "<": "&lt;",
            ">": "&gt;",
            '"': '&quot;',
            "'": '&#39;',
            "/": '&#x2F;'
          }

        escapeHtml = (string) ->
            return String(string).replace(/[&<>"'\/]/g, (s) ->
              return entityMap[s]
            )

        return escapeHtml
    ])
