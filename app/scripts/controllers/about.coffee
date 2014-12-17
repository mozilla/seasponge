'use strict'

###*
 # @ngdoc function
 # @name seaspongeApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the seaspongeApp
###
angular.module('seaspongeApp')
  .controller 'AboutController', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
