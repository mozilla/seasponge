angular.module('seaspongeApp')
.factory('KernelModeTrustBoundary', ['BaseBoundaryStencil', (BaseBoundaryStencil) ->
    return class KernelModeTrustBoundary extends BaseBoundaryStencil
      @title: "Kernel-Mode Trust Boundary"
])