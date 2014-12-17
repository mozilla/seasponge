angular.module('seaspongeApp')
.factory('BaseFlowStencil', ['BaseStencil', (BaseStencil) ->
    return class BaseFlowStencil extends BaseStencil
      @title: "Base"
      @category: "Flow"
      @shape: "ellipse"
])