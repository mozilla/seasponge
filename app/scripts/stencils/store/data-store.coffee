angular.module('seaspongeApp')
.factory('DataStoreStencil', ['BaseStoreStencil', (BaseStoreStencil) ->
    return class DataStoreStencil extends BaseStoreStencil
      @title: "Data Store"
])