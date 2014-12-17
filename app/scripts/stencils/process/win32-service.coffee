angular.module('seaspongeApp')
.factory('Win32ServiceStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class Win32ServiceStencil extends BaseProcessStencil
        @title: "Win32 Service"
        @shape: "circle"
])