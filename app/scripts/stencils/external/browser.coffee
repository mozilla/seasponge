angular.module('seaspongeApp')
.factory('Browser', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class Browser extends BaseExternalStencil
      @title: "Browser"
      @category: "External"
])