angular.module('seaspongeApp')
.factory('Authorization', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class Authorization extends BaseExternalStencil
      @title: "Authorization"
])