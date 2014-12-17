angular.module('seaspongeApp')
.factory('WindowsStoreProcessStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class WindowsStoreProcessStencil extends BaseProcessStencil
        @title: "Windows Store Process"
        @shape: "ellipse"
])