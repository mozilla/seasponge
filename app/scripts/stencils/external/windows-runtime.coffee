angular.module('seaspongeApp')
.factory('WindowsRuntime', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class WindowsRuntime extends BaseExternalStencil
      @title: "Windows Runtime"
])