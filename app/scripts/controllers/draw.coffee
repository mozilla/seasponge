'use strict'

###*
 # @ngdoc function
 # @name seaspongeApp.controller:DrawCtrl
 # @description
 # # DrawCtrl
 # Controller of the seaspongeApp
###
angular.module('seaspongeApp')
  .controller 'DrawController', ['$scope', 'Stencils', 'model', ($scope, Stencils, model) ->
    
    console.log('model', model)

    $scope.model = model

    $scope.stencils = Stencils

    $scope.menu = {
        infoOpen: false
        stencilsOpen: true
        threatsOpen: false
        propertiesOpen: false
    }

    $scope.fileName = "ExampleFileName"

    $scope.selectedStencil = false
    $scope.selectedDiagram = null

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

        # Save current Diagram
        $scope.selectedDiagram.save($scope.instance, $scope.container)

        # Serialize current Model
        serialized = model.serialize()
        console.log('model serialized', model, serialized)
        modelStr = JSON.stringify(serialized, undefined, 4)
        if (typeof(Storage) isnt "undefined")
            # Code for localStorage/sessionStorage.
            localStorage[fileName] = modelStr
        else
            # Sorry! No Web Storage support..
            alert("Sorry! No Web Storage support with this browser...")

        if confirm("Would you also like to download the #{fileName}.sponge file?")
            downloadData("#{fileName}.sponge", modelStr, "application/json")

    $scope.addStencil = (stencilClass) ->
        if $scope.selectedDiagram?
            # Create element
            element = $scope.selectedDiagram.addElement(stencilClass)
            # Render element
            element.render($scope.instance, $scope.container)
            return element

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

    $scope.loadDiagram = (diagram) ->
        if diagram?
            if $scope.selectedDiagram?
                selected = $scope.selectedDiagram
                # Save current Diagram
                selected.save($scope.instance, $scope.container)
                # Clear old diagram
                selected.constructor.clear($scope.instance, $scope.container)
                # Close diagram
                selected.selected = false
            # Render new diagram
            diagram.render($scope.instance, $scope.container)
            # Select new diagram
            diagram.selected = true
            $scope.selectedDiagram = diagram
            # console.log(diagram.serialize())
            # De-select Stencil
            $scope.selectedStencil = false

    $scope.openModelInfo = ->
        $scope.menu.infoOpen = true

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

    # Create Diagram in Model if non exists already
    if model.diagrams.length is 0
        diagram = model.addDiagram()
        console.log('Load new diagram', diagram)
        $scope.loadDiagram(diagram)
    else
        diagram = model.diagrams[0]
        $scope.loadDiagram(diagram)
            
    ]

