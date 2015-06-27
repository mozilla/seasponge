'use strict'

###*
 # @ngdoc function
 # @name seaspongeApp.controller:CreateCtrl
 # @description
 # # CreateCtrl
 # Controller of the seaspongeApp
###
angular.module('seaspongeApp')
  .controller 'MainController', ['$scope', '$location', 'model', 'config', ($scope, $location, model, config) ->

        $scope.title = "My Threat Model"
        $scope.authors = "Sherlock Holmes"
        $scope.version = "0.0.0"

        # Load Configuration from JSON string
        loadJSON = (data) ->

            try
                serialized = JSON.parse(data)
                config.setConfiguration(serialized)
            catch e
                console.warn(e)

        $scope.loadFile = (element) ->
            $scope.$apply (scope) ->
                reader = new FileReader()
                reader.onload = ->
                    $scope.$apply (scope) ->
                        data = reader.result
                        loadJSON(data)
                reader.readAsText(element.files[0])

        $scope.createModel = ->

            model.constructor()
            model.title = $scope.title
            model.authors = $scope.authors
            model.version = $scope.version
            $location.path('/draw')
    ]