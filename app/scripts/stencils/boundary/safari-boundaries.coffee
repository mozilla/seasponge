angular.module('seaspongeApp')
.factory('SafariBoundaries', ['BaseBoundaryStencil', (BaseBoundaryStencil) ->
    return class SafariBoundaries extends BaseBoundaryStencil
      @title: "Safari Boundaries"
      @category: "Boundary"
])