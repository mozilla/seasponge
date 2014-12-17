angular.module('seaspongeApp')
.factory('SQLDB', ['BaseStoreStencil', (BaseStoreStencil) ->
    return class SQLDB extends BaseStoreStencil
      @title: "SQL Database"
])