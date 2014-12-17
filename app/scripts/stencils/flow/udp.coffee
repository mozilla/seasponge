angular.module('seaspongeApp')
.factory('UDP', ['BaseFlowStencil', (BaseFlowStencil) ->
    return class UDP extends BaseFlowStencil
      @title: "UDP"
      @category: "Flow"
])