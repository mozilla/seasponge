angular.module('seaspongeApp')
.factory('WebServiceStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class WebServiceStencil extends BaseProcessStencil
        @title: "Web Service"
        @shape: "ellipse"
])