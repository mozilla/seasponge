angular.module('seaspongeApp')
.factory('ManagedStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class ManagedStencil extends BaseProcessStencil
        @title: "Managed"
        @shape: "circle"
])