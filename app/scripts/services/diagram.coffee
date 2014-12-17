'use strict'

###*
 # @ngdoc service
 # @name seaspongeApp.Diagram
 # @description
 # # Diagram
 # Factory in the seaspongeApp.
###
angular.module('seaspongeApp')
  .factory 'Diagram', [ 'BaseStencil', (BaseStencil) ->

    return class Diagram

        # Instance Variables
        id: jsPlumbUtil.uuid()
        title: "Untitled Diagram"
        elements: null
        flows: null
        boundaries: null

        # Class Methods
        @clear: (instance, container) ->
            # Connections
            conns = instance.getConnections();
            for con in conns
               instance.detach(conn);
            # Endpoints
            instance.removeAllEndpoints();
            # Everything
            instance.reset();
            # Elements
            $(container).empty();

        # Instance Methods
        constructor: () ->
            @elements = []
            @flows = []
            @boundaries = []
            
        serialize: =>
            serialized = {
                id: @id
                title: @title
                elements: (element.serialize() for element in @elements)
                flows: (flow.serialize() for flow in @flows)
                boundaries: (boundary.serialize() for boundary in @boundaries)
            }
            return serialized

        deserialize: (serialized) =>
            return @

        addElement: (instance, container, stencilClass) ->
            # console.log('addElement', arguments)
            # console.log('container', $scope.container)
            # Generate UUID
            uuid = jsPlumbUtil.uuid()
            # console.log('uuid: ', uuid)
            # stencil = new stencils.BaseStencil(uuid, $container, instance)
            stencil = new stencilClass(uuid, container, instance)
            # console.log(stencil)
            @elements.push(stencil)
            return stencil

        save: (instance, container) ->
            # Elements
            $elements = $('.stencil', container)
            elements = $.map($elements, (el) ->
                $element = $(el)
                return $element.data('stencil')
            )
            @elements = elements

            # TODO: Flows

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
                @addElement(instance, container, element.constructor)\
                .deserialize(element.serialize()) \
                for element in @elements

                # TODO: Render Flows

                # TODO: Render Boundaries

                # Repaint
                instance.repaintEverything()


    ]