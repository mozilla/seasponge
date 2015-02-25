angular.module('seaspongeApp')
.factory('AuthorizationStencil', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class AuthorizationStencil extends BaseExternalStencil
      @title: "Authorization"
])