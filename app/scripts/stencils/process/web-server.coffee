angular.module('seaspongeApp')
.factory('WebServerStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class WebServerStencil extends BaseProcessStencil
        @title: "Web Server"
        @shape: "circle"
])