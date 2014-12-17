angular.module('seaspongeApp')
.factory('WebStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class WebStencil extends BaseProcessStencil
        @title: "Web"
])