angular.module('seaspongeApp')
.factory('ThickStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class ThickStencil extends BaseProcessStencil
        @title: "Thick"
        @shape: "circle"
])