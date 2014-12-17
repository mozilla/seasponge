angular.module('seaspongeApp')
.factory('Cookie', ['BaseStoreStencil', (BaseStoreStencil) ->
    return class Cookie extends BaseStoreStencil
      @title: "Cookie"
])