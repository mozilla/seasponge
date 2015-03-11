angular.module('seaspongeApp')
.factory('AuthorizationStencil', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class AuthorizationStencil extends BaseExternalStencil
      @title: "Authorization"
      @icon: "/images/icons/key20.svg"
])