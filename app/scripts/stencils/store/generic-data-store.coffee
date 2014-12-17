angular.module('seaspongeApp')
.factory('GenericDataStore', ['BaseStoreStencil', (BaseStoreStencil) ->
    return class GenericDataStore extends BaseStoreStencil
      @title: "Generic Data Store"
])