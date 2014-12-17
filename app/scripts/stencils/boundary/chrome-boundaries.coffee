angular.module('seaspongeApp')
.factory('ChromeBoundaries', ['BaseBoundaryStencil', (BaseBoundaryStencil) ->
    return class ChromeBoundaries extends BaseBoundaryStencil
      @title: "Chrome Boundaries"
      @category: "Boundary"
])