angular.module('seaspongeApp')
.factory('DesktopStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class DesktopStencil extends BaseProcessStencil
        @title: "Desktop Computer"
])
