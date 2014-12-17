angular.module('seaspongeApp')
.factory('Devices', ['BaseStoreStencil', (BaseStoreStencil) ->
    return class Devices extends BaseStoreStencil
      @title: "Devices"
      @category: "Store"
])