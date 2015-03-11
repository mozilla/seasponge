angular.module('seaspongeApp')
.factory('DataStoreStencil', ['BaseStoreStencil', (BaseStoreStencil) ->
    return class DataStoreStencil extends BaseStoreStencil
      @title: "Data Store"
      @icon: "/images/icons/server11.svg"
])