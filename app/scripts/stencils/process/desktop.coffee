angular.module('seaspongeApp')
.factory('DesktopStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class DesktopStencil extends BaseProcessStencil
        @title: "Desktop Computer"
        @icon: "images/icons/monitor97.svg"
])
