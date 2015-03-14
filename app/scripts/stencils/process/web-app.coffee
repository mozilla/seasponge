angular.module('seaspongeApp')
.factory('WebApplicationStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class WebApplicationStencil extends BaseProcessStencil
        @title: "Web Application"
        @icon: "images/icons/website22.svg"
])
