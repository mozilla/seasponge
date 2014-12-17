angular.module('seaspongeApp')
.factory('RegistryHive', ['BaseStoreStencil', (BaseStoreStencil) ->
    return class RegistryHive extends BaseStoreStencil
      @title: "Registry Hive"
      @category: "Store"
])