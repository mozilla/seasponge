angular.module('seaspongeApp')
.factory('CacheStencil', ['BaseStoreStencil', (BaseStoreStencil) ->
    return class CacheStencil extends BaseStoreStencil
      @title: "Cache"
      @icon: "/images/icons/storage20.svg"
])