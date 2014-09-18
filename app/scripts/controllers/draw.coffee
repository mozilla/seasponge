'use strict'

###*
 # @ngdoc function
 # @name seaspongeApp.controller:DrawCtrl
 # @description
 # # DrawCtrl
 # Controller of the seaspongeApp
###
angular.module('seaspongeApp')
  .controller 'DrawCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
