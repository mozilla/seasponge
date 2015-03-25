angular.module('seaspongeApp')
.factory('ServerStencil', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class ServerStencil extends BaseExternalStencil
      @title: "Server"
      @icon: "images/icons/server11.png"
])