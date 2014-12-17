angular.module('seaspongeApp')
.factory('AppContainerBoundary', ['BaseBoundaryStencil', (BaseBoundaryStencil) ->
    return class AppContainerBoundary extends BaseBoundaryStencil
      @title: "App Container Boundary"
])