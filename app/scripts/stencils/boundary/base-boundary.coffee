angular.module('seaspongeApp')
.factory('BaseBoundaryStencil', ['BaseStencil', (BaseStencil) ->
    return class BaseBoundaryStencil extends BaseStencil
      @title: "Base"
      @category: "Boundary"
])