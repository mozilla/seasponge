###*
 # @ngdoc service
 # @name seaspongeApp.BaseStencil
 # @description
 # # BaseStencil
 # Factory in the seaspongeApp.
###
angular.module('seaspongeApp')
.factory('BaseStencil', [ ->

    return class BaseStencil

      # Class variables
      @title: "Base"
      @category: "Base"
      @anchors: []
      @icon: "http://png-5.findicons.com/files/icons/1070/software/128/mozilla_firefox.png"
      @classNames: ["stencil"]
      @shape: "rectange" # Default rectange

      # Instance variables
      uuid: null
      title: null
      icon: null
      $element: null
      $img: null
      location: null
      tags: null
      codeType: "Managed"
      runningAs: "Kernel"
      acceptsInput: "Kernel, System, or Local Admin"
      authenticationScheme: null
      authorizationScheme: null
      communicationProtocol: null
      dataClassifications: null
      securityControls: null
      notes: "There is no available notes."

      constructor: () ->
        # Instance variables
        @uuid = jsPlumbUtil.uuid()
        @title = @constructor.title
        @icon = @constructor.icon
        @tags = []
        @dataClassifications = []
        @securityControls = []
        @location = {
            left: 0
            top: 0
        }
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
        })
        @$elementTitle = $('<span/>', {
            class: "element-title"
        }).text("#{@title}")
        $category = $('<span/>', {
            class: "element-category"
        }).text("<#{@constructor.category}>")
        @$img = $('<img style="height:85%; width:85%; opacity:0.3; position:absolute; left:5px;">')
        @$img.attr('src', @icon)

        $p = $('<p/>')
            .append(@$elementTitle)
            .append("<br/>")
            .append($category)

        $element.append(@$img)
        $element.append($p)

        # Data
        @$element.data('stencil', @)
        # Add class names
        # console.log(@constructor.classNames)
        cls = @constructor.classNames.join(" ")
        shp = @constructor.shape
        $element.addClass(cls)
        $element.addClass(shp)
        @refreshIcon()

      render: (instance, $container) =>
        # Data
        @$element.data('stencil', @)
        # Check if $element has parent
        # console.log(@$element, @$element.parent(), @$element.parent().parent(), $container)
        # Check if there is no parent then
        # Check if parent is $container
        if @$element.parent().length is 0 or not @$element.parent().is($container)
            # Add to container
            $container.append(@$element) ;
        # Clear previous events
        @$element.unbind('click')
        @$element.unbind('mouseup')
        # Add events
        @$element.mouseup (event) =>
            @getPosition()
        @$element.click (event) =>
            # console.log(JSON.stringify(@serialize(), undefined, 4))
            $container.trigger "stencil-instance-click", [@, event]
        # suspend drawing and initialise.
        instance.doWhileSuspended =>
          # console.log(@plumbInstance)
          @_addEndpoints instance, @uuid, [
            "TopCenter"
            "BottomCenter"
          ], [
            "LeftMiddle"
            "RightMiddle"
          ]
          # # make all the window divs draggable
          $els = jsPlumb.getSelector(".diagram-contents .stencil")
          # console.log($els)
          instance.draggable $els,
            grid: [
              20
              20
            ]
          # THIS DEMO ONLY USES getSelector FOR CONVENIENCE. Use your library's appropriate selector
          # method, or document.querySelectorAll:
          #jsPlumb.draggable(document.querySelectorAll(".window"), { grid: [20, 20] });
          #
          instance.repaint()

      _addEndpoints: (instance, toId, sourceAnchors, targetAnchors) ->
        # console.log('add endpoints', arguments)
        # console.log(@sourceEndpoint, @targetEndpoint)
        console.log('_addEndpoints', instance.getContainer())
        i = 0
        while i < sourceAnchors.length
          sourceUUID = "#{toId}-#{sourceAnchors[i]}"
          instance.addEndpoint "#{toId}", @sourceEndpoint,
            anchor: sourceAnchors[i]
            uuid: sourceUUID
          i++
        j = 0
        while j < targetAnchors.length
          targetUUID = "#{toId}-#{targetAnchors[j]}"
          instance.addEndpoint "#{toId}", @targetEndpoint,
            anchor: targetAnchors[j]
            uuid: targetUUID
          j++
        return

      getPosition: ->
        # Check if $element is in DOM
        if @$element.parent().length > 0
            # Cache the location
            @location = @$element.position()
        # else
            # Do not update cached location
            # console.log('$element not in DOM')
        return @location

      setPosition: (position) ->
        @$element.css(position)
        return @getPosition()

      refreshTitle: ->
        @$elementTitle.text(@title)
        return @

      refreshIcon: ->
        @$img.attr('src', @icon)
        return @

      addDataClassification: ->
          @dataClassifications.push({
            "title": "Untitled Data Classification"
            "type": "public" # Default
          } )
          return @

      removeDataClassification: (dataClassification) ->
          index = @dataClassifications.indexOf(dataClassification)
          if index > - 1
              @dataClassifications.splice(index, 1)
          return @dataClassifications

      addSecurityControl: ->
          @securityControls.push({
            "title": "Untitled Security Control"
            "type": "confidentiality" # Default
          } )
          return @

      removeSecurityControl: (securityControl) ->
          index = @securityControls.indexOf(securityControl)
          if index > - 1
              @securityControls.splice(index, 1)
          return @securityControls

      serialize: =>
        serialized = {
          id: @uuid
          title: @title
          icon: @icon
          category: @constructor.category
          class: @constructor.name
          location: @getPosition()
          tags: @tags
          scale: 1.0
          notes: @notes
          attributes: {
            shape: @constructor.shape
            codeType: @codeType
            runningAs: @runningAs
            acceptsInput: @acceptsInput
            authenticationScheme: @authenticationScheme
            authorizationScheme: @authorizationScheme
            communicationProtocol: @communicationProtocol
            dataClassifications: @dataClassifications
            securityControls: @securityControls
          }
        }
        return serialized

      deserialize: (serialized) =>
        # console.log('serialized element', serialized)
        attr = serialized.attributes
        # Local
        @uuid = serialized.id
        @title = serialized.title
        @icon = serialized.icon
        @tags = serialized.tags
        @codeType = attr.codeType
        @runningAs = attr.runningAs
        @acceptsInput = attr.acceptsInput
        @authenticationScheme = attr.authenticationScheme
        @authorizationScheme = attr.authorizationScheme
        @communicationProtocol = attr.communicationProtocol
        @dataClassifications = attr.dataClassifications
        @securityControls = attr.securityControls
        @notes = serialized.notes
        # Update
        @$element.attr('id', @uuid)
        @setPosition(serialized.location)
        @refreshTitle()
        @refreshIcon()
        return @

      sourceEndpoint:
        # the definition of source endpoints (the small blue ones)
        endpoint: "Dot"
        paintStyle:
          strokeStyle: "#7AB02C"
          fillStyle: "transparent"
          radius: 7
          lineWidth: 3
        isSource: true
        maxConnections: -1
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
               - 0.5
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
    ]
)
