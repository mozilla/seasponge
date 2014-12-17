'use strict'

###*
 # @ngdoc function
 # @name seaspongeApp.controller:LoadCtrl
 # @description
 # # LoadCtrl
 # Controller of the seaspongeApp
###
angular.module('seaspongeApp')
  .controller 'LoadController', ['$scope', 'model', ($scope, model) ->

    console.log('model', model)

  ]