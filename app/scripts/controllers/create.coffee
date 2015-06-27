'use strict'

###*
 # @ngdoc function
 # @name seaspongeApp.controller:CreateCtrl
 # @description
 # # CreateCtrl
 # Controller of the seaspongeApp
###
angular.module('seaspongeApp')
  .controller 'CreateController', ['$scope', '$location', 'model', 'config', ($scope, $location, model, config) ->

        $scope.title = "My Threat Model"
        $scope.authors = "Sherlock Holmes"
        $scope.version = "0.0.0"

        # Load Configuration from JSON string
        loadJSON = (data) ->
            # Data = JSON string
            # console.log('data', data)
            try
                serialized = JSON.parse(data)
                # console.log(serialized)
                config.setConfiguration(serialized)
                # console.log(model)
            catch e
                console.warn(e)

        $scope.loadFile = (element) ->
            # console.log('loadFile', arguments)
            $scope.$apply (scope) ->
                reader = new FileReader()
                reader.onload = ->
                    $scope.$apply (scope) ->
                        data = reader.result
                        loadJSON(data)
                reader.readAsText(element.files[0])

        $scope.createModel = ->
            # Validate input
            # TODO

            # Clear old model data
            model.constructor()
            # Save input
            model.title = $scope.title
            model.authors = $scope.authors
            model.version = $scope.version

            # Transition to Draw route
            $location.path('/draw')
    ]