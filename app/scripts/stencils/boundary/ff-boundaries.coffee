angular.module('seaspongeApp')
.factory('FFBoundaries', ['BaseBoundaryStencil', (BaseBoundaryStencil) ->
    return class FFBoundaries extends BaseBoundaryStencil
      @title: "Firefox Boundaries"
])