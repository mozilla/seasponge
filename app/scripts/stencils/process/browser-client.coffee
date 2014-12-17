angular.module('seaspongeApp')
.factory('BrowserClientStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class BrowserClientStencil extends BaseProcessStencil
        @title: "Browser Client"
])