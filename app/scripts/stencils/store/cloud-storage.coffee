angular.module('seaspongeApp')
.factory('CloudStorage', ['BaseStoreStencil', (BaseStoreStencil) ->
    return class CloudStorage extends BaseStoreStencil
      @title: "Cloud Storage"
      @category: "Store"
])