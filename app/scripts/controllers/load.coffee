'use strict'

###*
 # @ngdoc function
 # @name seaspongeApp.controller:LoadCtrl
 # @description
 # # LoadCtrl
 # Controller of the seaspongeApp
###
angular.module('seaspongeApp')
  .controller 'LoadController', [
    '$scope', '$location', 'model',
    ($scope, $location, model) ->

        # Load Model from JSON string
        loadJSON = (data) ->
            # Data = JSON string
            # console.log('data', data)
            try
                serialized = JSON.parse(data)
                # console.log(serialized)
                model.deserialize(serialized)
                # console.log(model)
                # Transition to Draw route
                $location.path('/draw')
            catch e
                console.warn(e)

        # Load Model from query param
        params = $location.$$search
        if params.model
            modelData = params.model;
            delete $location.$$search.model
            loadJSON(modelData)

        $scope.loadFile = (element) ->
            # console.log('loadFile', arguments)
            $scope.$apply (scope) ->
                reader = new FileReader()
                reader.onload = ->
                    $scope.$apply (scope) ->
                        data = reader.result
                        loadJSON(data)
                reader.readAsText(element.files[0])

  ]
