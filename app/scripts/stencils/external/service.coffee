angular.module('seaspongeApp')
.factory('ServiceStencil', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class ServiceStencil extends BaseExternalStencil
      @title: "Service"
])