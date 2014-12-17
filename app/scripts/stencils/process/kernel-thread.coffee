angular.module('seaspongeApp')
.factory('KernelThreadStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class KernelThreadStencil extends BaseProcessStencil
        @title: "Kernel Thread"
])
