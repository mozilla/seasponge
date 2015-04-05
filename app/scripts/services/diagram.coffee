'use strict'

###*
 # @ngdoc service
 # @name seaspongeApp.Diagram
 # @description
 # # Diagram
 # Factory in the seaspongeApp.
###
angular.module('seaspongeApp')
  .factory 'Diagram', ['Stencils', 'BaseStencil', 'EscapeHtml', (Stencils, BaseStencil, escapeHtml) ->

    return class Diagram

        # Instance Variables
        id: null
        title: "Untitled Diagram"
        elements: null
        flows: null
        boundaries: null
        zoom: null

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
            @zoom = 1.0

        serialize: =>
            serialized = {
                id: @id
                title: @title
                elements: (element.serialize() for element in @elements)
                flows: @flows
                boundaries: (boundary.serialize() for boundary in @boundaries)
                zoom: @zoom
            }
            return serialized

        @stencilClassForElement: (name) ->
            stencilClasses = (stencilClass for stencilClass in Stencils when stencilClass.name is name)
            stencilClass = stencilClasses[0]
            if not stencilClass?
                stencilClass = BaseStencil
            return stencilClass

        deserialize: (serialized) =>
            # Local
            @id = serialized.id
            @title = serialized.title
            # Nested
            @elements = (@addSerializedElement(element) \
                for element in serialized.elements)
            @flows = serialized.flows
            @zoom = serialized.zoom
            return @

        addSerializedElement: (element) =>
            @addElement(
                @constructor.stencilClassForElement(element.class)) \
                .deserialize(element)

        addElement: (stencilClass) ->
            stencil = new stencilClass()
            # console.log(stencil)
            @elements.push(stencil)
            return stencil

        deleteElement: (element) ->
            index = @elements.indexOf(element)
            if index > -1
                @elements.splice(index, 1)

        deleteFlow: (flow) ->
            jsPlumb.detach(flow)

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
            @flows = ({
                sourceUuid: flow.endpoints[0]?.getUuid(),
                targetUuid: flow.endpoints[1]?.getUuid(),
                properties: flow.properties
                } for flow in cons)
            console.log('flows', @flows)

            # TODO: Boundaries

            return @

        render: (instance, container) =>

            # console.log('Render diagram!', @, instance)

            jsPlumb.ready =>

              # Get $scope
              $scope = angular.element(container).scope()

              init = (connection) =>
                # console.log('init connection', connection)
                connection.properties = connection.properties || {
                    label: connection.sourceId.substring(15) + "-" + connection.targetId.substring(15)
                    tags: []
                }
                # connection.getOverlay("label").setLabel connection.sourceId.substring(15) + "-" + connection.targetId.substring(15)
                connection.refreshLabel = ->
                    connection.getOverlay("label").setLabel(escapeHtml(connection.properties.label))
                connection.refreshLabel()

                connection.bind "editCompleted", (o) =>
                #   console.log "connection edited. path is now ", o.path  unless typeof console is "undefined"
                  $scope.$apply =>
                      @save(instance, container)
                  return
                # $scope.$apply =>
                @save(instance, container)
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
                instance.bind "click", (conn, originalEvent) =>
                  container.trigger "flow-instance-click", [conn, originalEvent]
                #   jsPlumb.detach conn  if confirm("Delete connection from " + conn.sourceId + " to " + conn.targetId + "?")
                #   $scope.$apply =>
                #       @save(instance, container)
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
                for flow in @flows
                  conn = instance.connect({
                                    uuids: [flow.sourceUuid, flow.targetUuid]
                                    })
                #   console.log(conn)
                  conn.properties = flow.properties
                  conn.refreshLabel()

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

                # FIXME: Diagram should be passed the Drawing Panel
                # In fact, drawingPanel should be the container
                $drawingPanel = $('.drawing-panel')

                # Zoom
                scale = "scale(#{@zoom})"
                $drawingPanel.css({
                  "-webkit-transform": scale,
                  "-moz-transform": scale,
                  "-ms-transform": scale,
                  "-o-transform": scale,
                  "transform": scale
                })
                $()
                instance.setZoom(@zoom)

                # Repaint
                instance.repaint()
                instance.repaintEverything()


    ]
