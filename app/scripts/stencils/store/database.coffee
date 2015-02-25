angular.module('seaspongeApp')
.factory('DatabaseStencil', ['BaseStoreStencil', (BaseStoreStencil) ->
    return class DatabaseStencil extends BaseStoreStencil
      @title: "Database"
])