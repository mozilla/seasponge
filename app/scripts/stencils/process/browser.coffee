angular.module('seaspongeApp')
.factory('WebBrowserStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class WebBrowserStencil extends BaseProcessStencil
        @title: "Web Browser"
        @icon: "/images/icons/website17.svg"
])