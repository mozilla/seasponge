'use strict'

###*
 # @ngdoc function
 # @name seaspongeApp.controller:CreateCtrl
 # @description
 # # CreateCtrl
 # Controller of the seaspongeApp
###
angular.module('seaspongeApp')
  .controller 'CreateController', ['$scope', '$location', 'model', ($scope, $location, model) ->
    
        console.log('model', model);

        $scope.title = "Example 1"
        $scope.authors = "Glavin Wiechert"
        $scope.version = "0.0.0"

        $scope.createModel = ->
            # Validate input
            # TODO

            # Save input
            model.title = $scope.title
            model.authors = $scope.authors
            model.version = $scope.version

            # Transition to Draw route
            $location.path('/draw')

    ]