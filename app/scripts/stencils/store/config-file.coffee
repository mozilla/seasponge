angular.module('seaspongeApp')
.factory('ConfigFile', ['BaseStoreStencil', (BaseStoreStencil) ->
    return class ConfigFile extends BaseStoreStencil
      @title: "Configuration File"
      @category: "Store"
])