angular.module('seaspongeApp')
.factory('Cache', ['BaseStoreStencil', (BaseStoreStencil) ->
    return class Cache extends BaseStoreStencil
      @title: "Cache"
])