angular.module('seaspongeApp')
.factory('DatabaseStencil', ['BaseStoreStencil', (BaseStoreStencil) ->
    return class DatabaseStencil extends BaseStoreStencil
      @title: "Database"
      @icon: "/images/icons/database11.svg"
])