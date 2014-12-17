angular.module('seaspongeApp').factory('BaseStencil', ->

    return class BaseStencil

      # Class variables
      @title: "Base"
      @category: "Base"
      @anchors: []
      @icon: "http://png-5.findicons.com/files/icons/1070/software/128/mozilla_firefox.png"
      @classNames: ["stencil"]
      @shape: "rectange" # Default rectange

      # Instance variables
      $element: null
      tags: []
      codeType: "Managed"
      runningAs: "Kernel"
      acceptsInput: "Kernel, System, or Local Admin"
      authenticationScheme: null
      authorizationScheme: null
      communicationProtocol: null
      notes: "There is no available notes."

      constructor: (@uuid, @$container, @plumbInstance) ->
        # Instance variables
        @authenticationScheme = {
            uses: false
            description: null
        }
        @authorizationScheme = {
            uses: false
            description: null
        }
        @communicationProtocol = {
            uses: false
            description: null
        }

        # Create new element
        @$element = $element = $('<div />', {
          id: @uuid
        }).append($('<p/>').text("#{@constructor.title} <#{@constructor.category}>"))
        # Data
        @$element.data('stencil', @)
        # Add class names
        # console.log(@constructor.classNames)
        cls = @constructor.classNames.join(" ")
        shp = @constructor.shape
        $element.addClass(cls)
        $element.addClass(shp)
        # Add to container
        @$container.append($element);
        # Add events
        @$element.click (event) =>
            # console.log(JSON.stringify(@serialize(), undefined, 4))
            @$container.trigger "stencil-instance-click", [@, event]
        # suspend drawing and initialise.
        @plumbInstance.doWhileSuspended =>
          # console.log(@plumbInstance)

          @_addEndpoints @plumbInstance, @uuid, [
            "TopCenter"
            "BottomCenter"
          ], [
            "LeftMiddle"
            "RightMiddle"
          ]
          # # make all the window divs draggable
          $els = jsPlumb.getSelector(".diagram-contents .stencil")
          # console.log($els)
          @plumbInstance.draggable $els,
            grid: [
              20
              20
            ]

          # THIS DEMO ONLY USES getSelector FOR CONVENIENCE. Use your library's appropriate selector
          # method, or document.querySelectorAll:
          #jsPlumb.draggable(document.querySelectorAll(".window"), { grid: [20, 20] });

          #
          @plumbInstance.repaint()

      _addEndpoints: (instance, toId, sourceAnchors, targetAnchors) ->
        # console.log('add endpoints', arguments)
        # console.log(@sourceEndpoint, @targetEndpoint)
        i = 0
        while i < sourceAnchors.length
          sourceUUID = toId + sourceAnchors[i]
          instance.addEndpoint "#{toId}", @sourceEndpoint,
            anchor: sourceAnchors[i]
            uuid: sourceUUID
          i++
        j = 0
        while j < targetAnchors.length
          targetUUID = toId + targetAnchors[j]
          instance.addEndpoint "#{toId}", @targetEndpoint,
            anchor: targetAnchors[j]
            uuid: targetUUID
          j++
        return

      getPosition: ->
        return @$element.position()

      serialize: ->
        serialized = {
          id: @uuid
          name: @constructor.title
          category: @constructor.category
          class: @constructor.name
          location: @getPosition()
          tags: @tags
          scale: 1.0
          attributes: {
            shape: @constructor.shape
            codeType: @codeType
            runningAs: @runningAs
            acceptsInput: @acceptsInput
            authenticationScheme: @authenticationScheme
            authorizationScheme: @authorizationScheme
            communicationProtocol: @communicationProtocol
          }
        }
        return serialized

      sourceEndpoint:
        # the definition of source endpoints (the small blue ones)
        endpoint: "Dot"
        paintStyle:
          strokeStyle: "#7AB02C"
          fillStyle: "transparent"
          radius: 7
          lineWidth: 3
        isSource: true
        connector: [
          "Flowchart"
          {
            stub: [
              40
              60
            ]
            gap: 10
            cornerRadius: 5
            alwaysRespectStubs: true
          }
        ]
        connectorStyle: @connectorPaintStyle
        hoverPaintStyle: @endpointHoverStyle
        connectorHoverStyle: @connectorHoverStyle
        dragOptions: {}
        overlays: [[
          "Label"
          {
            location: [
              0.5
              1.5
            ]
            # label: "Drag"
            cssClass: "endpointSourceLabel"
          }
        ]]


      targetEndpoint:
        # the definition of target endpoints (will appear when the user drags a connection)
        endpoint: "Dot"
        paintStyle:
          fillStyle: "#7AB02C"
          radius: 11
        hoverPaintStyle: @endpointHoverStyle
        maxConnections: -1
        dropOptions:
          hoverClass: "hover"
          activeClass: "active"
        isTarget: true
        overlays: [[
          "Label"
          {
            location: [
              0.5
              -0.5
            ]
            # label: "Drop"
            cssClass: "endpointTargetLabel"
          }
        ]]

      # this is the paint style for the connecting lines..
      connectorPaintStyle:
        lineWidth: 4
        strokeStyle: "#61B7CF"
        joinstyle: "round"
        outlineColor: "white"
        outlineWidth: 2

      connectorHoverStyle:
        # .. and this is the hover style.
        lineWidth: 4
        strokeStyle: "#216477"
        outlineWidth: 2
        outlineColor: "white"

      endpointHoverStyle:
        fillStyle: "#216477"
        strokeStyle: "#216477"
)