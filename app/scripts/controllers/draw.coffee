'use strict'

###*
 # @ngdoc function
 # @name seaspongeApp.controller:DrawCtrl
 # @description
 # # DrawCtrl
 # Controller of the seaspongeApp
###
angular.module('seaspongeApp')
  .controller 'DrawCtrl', ($scope) ->

    $scope.stencils = window.stencils

    $scope.menu = {
      stencilsOpen: true
      propertiesOpen: false
    }

    $scope.selectedStencil = false

    # Get container
    $scope.container = $('.diagram-contents')

    $scope.stencilTypes = (() ->
      arr = []
      arr.push(stencil.type) for name, stencil of $scope.stencils \
      when arr.indexOf(stencil.type) is -1 and stencil.type isnt "Base"
      console.log('types', arr, $scope.stencils)
      return arr
    )()

    $scope.dropStencil = @dropStencil = (event, ui) ->
        console.log('dropStencil', arguments)
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
            console.log(offset)
            # i.$element.offset(offset)
            $se = i.$element
            console.log($se, $se.offset(), $se.position())
            $se.css(offset)
            console.log($se, $se.offset(), $se.position())
            $scope.instance.repaintEverything()
            console.log($se, $se.offset(), $se.position())

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
            console.log "stencil-instance-click", arguments
            $scope.$apply ->
                # Remove selected class from all selected
                $('.selected-stencil').removeClass('selected-stencil')
                # Check if same or different stencil instance
                if $scope.selectedStencil is inst
                    # Same instance
                    # Change selected in $scope
                    $scope.selectedStencil = null
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
      console.log('container', $scope.container)
      # Generate UUID
      uuid = jsPlumbUtil.uuid()
      console.log('uuid: ', uuid)
      #
      # stencil = new stencils.BaseStencil(uuid, $container, instance)
      stencil = new stencilClass(uuid, $scope.container, instance)
      console.log(stencil)
      return stencil
