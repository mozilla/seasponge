'use strict'

###*
 # @ngdoc service
 # @name seaspongeApp.model
 # @description
 # # model
 # Factory in the seaspongeApp.
###
angular.module('seaspongeApp')
    .factory('model', ['Diagram', (Diagram) ->

        class Model

            # Class Variables

            # Instance Variables
            title: "Untitled Model"
            version: "0.0.0"
            authors: []
            threats: []
            notes: ""
            diagrams: []

            # Class Methods

            # Instance Methods
            addDiagram: ->
                # Create new Diagram and push to array
                diagram = new Diagram()
                @diagrams.push(diagram)
                return diagram

            removeDiagram: (diagram) ->
                @diagrams.remove(diagram)

            serialize: =>
                serialized = {
                    title: @title
                    version: @version
                    date: new Date()
                    authors: @authors
                    threats: @threats
                    notes: @notes
                    diagrams: (diagram.serialize() for diagram in @diagrams)
                }
                return serialized

            deserialize: (serialized) =>
                return @

        return new Model() # Return Model instance
    ])