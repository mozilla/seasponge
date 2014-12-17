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
            authors: ""
            threats: ""
            notes: ""
            diagrams: null

            # Class Methods

            # Instance Methods
            constructor: () ->
                @diagrams = []

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
                # Local
                @title = serialized.title
                @version = serialized.version
                @authors = serialized.authors
                @threats = serialized.threats
                @notes = serialized.notes

                # Nested
                @diagrams = (@addDiagram().deserialize(diagram) for diagram in serialized.diagrams)

                return @

        return new Model() # Return Model instance
    ])