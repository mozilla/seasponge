angular.module('seaspongeApp')
.factory('MobileWebBrowserStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class MobileWebBrowserStencil extends BaseProcessStencil
        @title: "Mobile Web Browser"
        @icon: "/images/icons/wifi7.svg"
])