angular.module('seaspongeApp')
.factory('WebBrowserStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class WebBrowserStencil extends BaseProcessStencil
        @title: "Web Browser"
])