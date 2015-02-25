angular.module('seaspongeApp')
.factory('ServerStencil', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class ServerStencil extends BaseExternalStencil
      @title: "Server"
])