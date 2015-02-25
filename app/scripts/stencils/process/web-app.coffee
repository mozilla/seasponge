angular.module('seaspongeApp')
.factory('WebApplicationStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class WebApplicationStencil extends BaseProcessStencil
        @title: "Web Application"
])
