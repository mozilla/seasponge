angular.module('seaspongeApp')
.factory('MachineTrustBoundary', ['BaseBoundaryStencil', (BaseBoundaryStencil) ->
    return class MachineTrustBoundary extends BaseBoundaryStencil
      @title: "Machine Trust Boundary"
])