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

        $scope.loadFile = (element) ->
            # console.log('loadFile', arguments)
            $scope.$apply (scope) ->
                reader = new FileReader()
                reader.onload = ->
                    $scope.$apply (scope) ->
                        data = reader.result
                        # console.log(data)
                        serialized = JSON.parse(data)
                        # console.log(serialized)
                        model.deserialize(serialized)
                        # console.log(model)
                        # Transition to Draw route
                        $location.path('/draw')
                reader.readAsText(element.files[0])

  ]