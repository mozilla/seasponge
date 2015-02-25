angular.module('seaspongeApp')
.factory('CacheStencil', ['BaseStoreStencil', (BaseStoreStencil) ->
    return class CacheStencil extends BaseStoreStencil
      @title: "Cache"
])