angular.module('seaspongeApp')
.factory('WebServiceExternal', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class WebServiceExternal extends BaseExternalStencil
      @title: "Web Service"
])