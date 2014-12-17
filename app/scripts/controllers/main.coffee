'use strict'

###*
 # @ngdoc function
 # @name seaspongeApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the seaspongeApp
###
angular.module('seaspongeApp')
  .controller 'MainController', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
