angular.module('seaspongeApp')
.factory('UserModeTrustBoundary', ['BaseBoundaryStencil', (BaseBoundaryStencil) ->
    return class UserModeTrustBoundary extends BaseBoundaryStencil
      @title: "User-Mode Trust Boundary"
      @category: "Boundary"
])