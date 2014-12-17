angular.module('seaspongeApp')
.factory('IEBoundaries', ['BaseBoundaryStencil', (BaseBoundaryStencil) ->
    return class IEBoundaries extends BaseBoundaryStencil
      @title: "Internet Explorer Boundaries"
      @category: "Boundary"
])