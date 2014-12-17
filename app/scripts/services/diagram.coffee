'use strict'

###*
 # @ngdoc service
 # @name seaspongeApp.Diagram
 # @description
 # # Diagram
 # Factory in the seaspongeApp.
###
angular.module('seaspongeApp')
  .factory 'Diagram', [ 'Stencils', (Stencils) ->

    return class Diagram

        # Instance Variables
        id: null
        title: "Untitled Diagram"
        elements: null
        flows: null
        boundaries: null

        # Class Methods
        @clear: (instance, container) ->
            # Connections
            cons = instance.getConnections()
            instance.detach(con) for con in cons
            # Endpoints
            instance.removeAllEndpoints()
            # Everything
            instance.reset()
            # Elements
            $(container).empty()

        # Instance Methods
        constructor: () ->
            @id = jsPlumbUtil.uuid()
            @elements = []
            @flows = []
            @boundaries = []

        serialize: =>
            serialized = {
                id: @id
                title: @title
                elements: (element.serialize() for element in @elements)
                flows: @flows
                boundaries: (boundary.serialize() for boundary in @boundaries)
            }
            return serialized

        @stencilClassForElement: (name) ->
            stencilClass = (stencilClass for stencilClass in Stencils when stencilClass.name is name)
            # console.log('stencilClass', stencilClass)
            return stencilClass[0]

        deserialize: (serialized) =>
            # Local
            @id = serialized.id
            @title = serialized.title
            # Nested
            @elements = (@addElement(
                @constructor.stencilClassForElement(element.class))\
                .deserialize(element) \
                for element in serialized.elements)
            @flows = serialized.flows
            return @

        addElement: (stencilClass) ->
            # stencil = new stencils.BaseStencil(uuid, $container, instance)
            stencil = new stencilClass()
            # console.log(stencil)
            @elements.push(stencil)
            return stencil

        save: (instance, container) ->
            # console.log('save', instance, container)
            # console.log('save before', @serialize())
            # Elements
            $elements = $('.stencil', container)
            # console.log('$elements', $elements)
            elements = ($(element).data('stencil') for element in $elements)
            # console.log(elements)
            @elements = elements
            # console.log('save after', @serialize())

            # Flows (Connections)
            cons = instance.getConnections()
            @flows = ({sourceId: flow.sourceId, targetId: flow.targetId} \
                    for flow in cons)

            # TODO: Boundaries

            return @

        render: (instance, container) =>

            # console.log('Render diagram!', @, instance)

            jsPlumb.ready =>
              
              init = (connection) ->
                connection.getOverlay("label").setLabel connection.sourceId.substring(15) + "-" + connection.targetId.substring(15)
                connection.bind "editCompleted", (o) ->
                  console.log "connection edited. path is now ", o.path  unless typeof console is "undefined"
                  return
                return

              # suspend drawing and initialise.
              instance.doWhileSuspended =>
                # listen for new connections; initialise them the same way we initialise the connections at startup.
                instance.bind "connection", (connInfo, originalEvent) ->
                  init connInfo.connection
                  return

                #
                #
                # listen for clicks on connections, and offer to delete connections on click.
                #
                instance.bind "click", (conn, originalEvent) ->
                  jsPlumb.detach conn  if confirm("Delete connection from " + conn.sourceId + " to " + conn.targetId + "?")
                  return

                instance.bind "connectionDrag", (connection) ->
                  console.log "connection " + connection.id + " is being dragged. suspendedElement is ", connection.suspendedElement, " of type ", connection.suspendedElementType
                  return

                instance.bind "connectionDragStop", (connection) ->
                  console.log "connection " + connection.id + " was dragged"
                  return

                instance.bind "connectionMoved", (params) ->
                  console.log "connection " + params.connection.id + " was moved"
                  return

                instance.bind "contextmenu", (component, originalEvent) ->
                  console.log "contextmenu: ", component, originalEvent
                  return

                # Render Elements
                element.render(instance, container) for element in @elements

                # Render Flows
                instance.connect({
                    source: flow.sourceId
                    target: flow.targetId
                    }) for flow in @flows

                # TODO: Render Boundaries

                # make all the window divs draggable
                instance.draggable jsPlumb.getSelector(".diagram-contents .stencil"),
                  grid: [
                    20
                    20
                  ]

                # THIS DEMO ONLY USES getSelector FOR CONVENIENCE. Use your library's appropriate selector
                # method, or document.querySelectorAll:
                #jsPlumb.draggable(document.querySelectorAll(".window"), { grid: [20, 20] });
                #

                # Repaint
                instance.repaint()
                instance.repaintEverything()


    ]