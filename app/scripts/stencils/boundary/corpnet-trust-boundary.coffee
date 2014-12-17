angular.module('seaspongeApp')
.factory('CorpNetTrustBoundary', ['BaseBoundaryStencil', (BaseBoundaryStencil) ->
    return class CorpNetTrustBoundary extends BaseBoundaryStencil
      @title: "CorpNet Trust Boundary"
      @category: "Boundary"
])