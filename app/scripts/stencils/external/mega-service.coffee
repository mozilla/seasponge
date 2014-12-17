angular.module('seaspongeApp')
.factory('MegaService', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class MegaService extends BaseExternalStencil
      @title: "Mega Service"
      @category: "External"
])