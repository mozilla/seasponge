angular.module('seaspongeApp')
.factory('GenericTrustBoundary', ['BaseBoundaryStencil', (BaseBoundaryStencil) ->
    return class GenericTrustBoundary extends BaseBoundaryStencil
      @title: "Generic Trust Boundary"
])