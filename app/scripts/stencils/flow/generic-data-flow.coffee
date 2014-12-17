angular.module('seaspongeApp')
.factory('GenericDataFlow', ['BaseFlowStencil', (BaseFlowStencil) ->
    return class GenericDataFlow extends BaseFlowStencil
      @title: "Generic Data Flow"
])