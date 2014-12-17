angular.module('seaspongeApp')
.factory('NonRelationalDB', ['BaseStoreStencil', (BaseStoreStencil) ->
    return class NonRelationalDB extends BaseStoreStencil
      @title: "Non-Relational Database"
      @category: "Store"
])