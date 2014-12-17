angular.module('seaspongeApp')
.factory('InternetBoundary', ['BaseBoundaryStencil', (BaseBoundaryStencil) ->
    return class InternetBoundary extends BaseBoundaryStencil
      @title: "Internet Boundary"
])