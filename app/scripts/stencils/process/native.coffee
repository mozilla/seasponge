angular.module('seaspongeApp')
.factory('NativeStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class NativeStencil extends BaseProcessStencil
        @title: "Native"
        @shape: "ellipse"
])

