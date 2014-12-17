angular.module('seaspongeApp')
.factory('BaseProcessStencil', ['BaseStencil', (BaseStencil) ->
    return class BaseProcessStencil extends BaseStencil
      @title: "Base"
      @category: "Process"
])