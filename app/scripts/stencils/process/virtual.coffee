angular.module('seaspongeApp')
.factory('VirtualStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class VirtualStencil extends BaseProcessStencil
        @title: "Virtual"
])