@stencils = {}
class @stencils.BaseStencil

  @title: "Base"
  @type: "Base"
  @anchors: []
  @icon: "http://upload.wikimedia.org/wikipedia/de/2/2e/Mozilla_Firefox_Logo.png"
  @classNames: ["stencil", "window"]
  $element: null

  constructor: (@uuid, @$container, @plumbInstance) ->
    # Create new element
    @$element = $element = $('<div/>', {
      id: @uuid
    }).append($('<p/>').text("#{@constructor.title} <#{@constructor.type}>"))
    # Add class names
    console.log(@constructor.classNames)
    cls = @constructor.classNames.join(" ")
    $element.addClass(cls)
    # Add to container
    @$container.append($element);
    # suspend drawing and initialise.
    @plumbInstance.doWhileSuspended =>
      console.log(@plumbInstance)
      # #
      @_addEndpoints @plumbInstance, @uuid, [
        "TopCenter"
        "BottomCenter"
      ], [
        "LeftMiddle"
        "RightMiddle"
      ]
      # # make all the window divs draggable
      $els = jsPlumb.getSelector(".flowchart-demo .stencil")
      console.log($els)
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
    console.log('add endpoints', arguments)
    console.log(@sourceEndpoint, @targetEndpoint)
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
