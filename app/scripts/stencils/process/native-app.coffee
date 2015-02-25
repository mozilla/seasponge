angular.module('seaspongeApp')
.factory('NativeApplicationStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class NativeApplicationStencil extends BaseProcessStencil
        @title: "Native Application"
])
