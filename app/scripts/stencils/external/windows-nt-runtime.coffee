angular.module('seaspongeApp')
.factory('WindowsNTRuntime', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class WindowsNTRuntime extends BaseExternalStencil
      @title: "Windows NT Runtime"
])