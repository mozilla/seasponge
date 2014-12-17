angular.module('seaspongeApp')
.factory('BaseExternalStencil', ['BaseStencil', (BaseStencil) ->
    return class BaseExternalStencil extends BaseStencil
      @title: "Base"
      @category: "External"
      @shape: "circle"
])