angular.module('seaspongeApp')
.factory('WebExternal', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class WebExternal extends BaseExternalStencil
      @title: "Web"
      @category: "External"
])