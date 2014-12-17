angular.module('seaspongeApp')
.factory('ThreadStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class ThreadStencil extends BaseProcessStencil
        @title: "Thread"
])