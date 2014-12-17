angular.module('seaspongeApp')
.factory('WindowsDotNETRuntime', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class WindowsDotNETRuntime extends BaseExternalStencil
      @title: "Windows .NET Runtime"
])