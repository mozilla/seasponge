'use strict'

###*
 # @ngdoc function
 # @name seaspongeApp.controller:DrawCtrl
 # @description
 # # DrawCtrl
 # Controller of the seaspongeApp
###
angular.module('seaspongeApp')
  .controller 'DrawController', ['$scope', 'Stencils', ($scope, Stencils) ->
    
    
    $scope.stencils = Stencils
    $scope.stencilQuery = ''
    $scope.filterFn = (query, values) ->
      results = []
      angular.forEach values, ((value, key) ->
        @push value  if value.title.toLowerCase().indexOf(query.toLowerCase()) isnt -1 or value.category.toLowerCase().indexOf(query.toLowerCase()) isnt -1
        return
      ), results
      if results.length > 0
        results
      else
        values

    $scope.menu = {
      stencilsOpen: true
      propertiesOpen: false
    }

    $scope.fileName = "ExampleFileName"

    $scope.selectedStencil = false

    # UI
    $scope.codeTypeOptions = [
        "Not selected"
        "Managed"
        "Unmanaged"
    ]
    $scope.runningAsOptions = [
        "Kernel"
        "System"
        "Network Service"
        "Local Service"
        "Administrator"
        "Standard User with Elevation"
        "Standard User without Elevation"
        "Windows Store App"
    ]
    $scope.acceptsInputOptions = [
        "Not Selected"
        "Any Remote User or Entity"
        "Kernel, System, or Local Admin"
        "Local or Network Service"
        "Local Standard User With Elevation"
        "Local Standard User Without Elevation"
        "Windows Store Apps or App Container Processes"
        "Nothing"
        "Other"
    ]

    # Get container
    $scope.container = $('.diagram-contents')

    # $scope.stencilTypes = (() ->
    #   arr = []
    #   arr.push(stencil.type) for name, stencil of $scope.stencils \
    #   when arr.indexOf(stencil.type) is -1 and stencil.type isnt "Base"
    #   console.log('types', arr, $scope.stencils)
    #   return arr
    # )()

    # Drag'n'Drop Stencil support
    $scope.dropStencil = @dropStencil = (event, ui) ->
        # console.log('dropStencil', arguments)
        el = ui.draggable
        $el = $(el)
        #s = $el.data('$ngModelController')
        ctrl = $el.controller('ngModel')
        if ctrl
            stencil = ctrl.$modelValue
            # console.log(el, $el, stencil)
            i = $scope.addStencil(stencil)
            b = $scope.container.offset()
            offset = {
                'left': event.pageX - b.left
                'top': event.pageY - b.top
            }
            # console.log(offset)
            # i.$element.offset(offset)
            $se = i.$element
            # console.log($se, $se.offset(), $se.position())
            $se.css(offset)
            # console.log($se, $se.offset(), $se.position())
            $scope.instance.repaintEverything()
            # console.log($se, $se.offset(), $se.position())

    downloadData = (name, data, type) ->
        # Browser support
        window.URL = window.URL || window.webkitURL;
        # Arg defaults 
        type = type || "text/plain";
        name = name || "download"
        data = data || ""
        # Create Blob
        blob = new Blob([data], {type: type})
        url = window.URL.createObjectURL(blob)
        # Create link
        link = document.createElement("a")
        link.download = name
        link.href = url
        # Download!
        link.click()

    # Save the Model
    $scope.saveModel = ->

        fileName = prompt("Please enter file name", $scope.fileName)

        if not fileName?
            return
        $scope.fileName = fileName

        $stencils = $('.stencil', $scope.container)
        stencils = $.map($stencils, (el) ->
                $stencil = $(el)
                return $stencil.data('stencil')
            )
        serializedElements = (stencil.serialize() for stencil in stencils)
        # console.log('serializedElements', serializedElements)
        model = {
            "version": "0.0.0"
            "date": new Date(),
            "authors": [ "Glavin Wiechert" ]
            "diagrams": []
        }
        diagrams = model.diagrams
        diagram = {
            "id": jsPlumbUtil.uuid()
            "name": "Diagram 1"
            "elements": serializedElements
            "flows": []
            "boundaries": []
        }
        diagrams.push(diagram)
        console.log('model', model)

        modelStr = JSON.stringify(model, undefined, 4)
        if (typeof(Storage) isnt "undefined")
            # Code for localStorage/sessionStorage.
            localStorage[fileName] = modelStr
        else
            # Sorry! No Web Storage support..
            alert("Sorry! No Web Storage support with this browser...")

        if confirm("Would you also like to download the #{fileName}.sponge file?")
            downloadData("#{fileName}.sponge", modelStr, "application/json")


    jsPlumb.ready ->
      $scope.instance = instance = jsPlumb.getInstance(
        # default drag options
        DragOptions:
          cursor: "pointer"
          zIndex: 2000
        # the overlays to decorate each connection with.  note that the label overlay uses a function to generate the label text; in this
        # case it returns the 'labelText' member that we set on each connection in the 'init' method below.
        ConnectionOverlays: [
          [
            "Arrow"
            {
              location: 1
            }
          ]
          [
            "Label"
            {
              location: 0.1
              id: "label"
              cssClass: "aLabel"
            }
          ]
        ]
        Container: "content-right"
      )

      init = (connection) ->
        connection.getOverlay("label").setLabel connection.sourceId.substring(15) + "-" + connection.targetId.substring(15)
        connection.bind "editCompleted", (o) ->
          console.log "connection edited. path is now ", o.path  unless typeof console is "undefined"
          return
        return

      # suspend drawing and initialise.
      instance.doWhileSuspended ->
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

        $scope.container.on "stencil-instance-click", (e1, inst, e2) ->
            # console.log "stencil-instance-click", arguments
            $scope.$apply ->
                # Remove selected class from all selected
                $('.selected-stencil').removeClass('selected-stencil')
                # Check if same or different stencil instance
                if $scope.selectedStencil is inst
                    # Same instance
                    # Change selected in $scope
                    $scope.selectedStencil = false
                    $scope.menu.propertiesOpen = false
                    $scope.menu.stencilsOpen = true
                else
                    # Add selected class
                    inst.$element.addClass('selected-stencil')
                    # Change selected in $scope
                    $scope.selectedStencil = inst
                    $scope.menu.stencilsOpen = false
                    $scope.menu.propertiesOpen = true


        return
      #jsPlumb.fire "jsPlumbDemoLoaded", instance
      return

    $scope.addStencil = (stencilClass) ->
      instance = $scope.instance
      # console.log('container', $scope.container)
      # Generate UUID
      uuid = jsPlumbUtil.uuid()
      # console.log('uuid: ', uuid)
      # stencil = new stencils.BaseStencil(uuid, $container, instance)
      stencil = new stencilClass(uuid, $scope.container, instance)
      # console.log(stencil)
      return stencil

    ]
