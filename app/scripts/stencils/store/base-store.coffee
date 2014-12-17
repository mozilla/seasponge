angular.module('seaspongeApp')
.factory('BaseStoreStencil', ['BaseStencil', (BaseStencil) ->
    return class BaseStoreStencil extends BaseStencil
      @title: "Base"
      @category: "Store"
])