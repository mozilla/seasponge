angular.module('seaspongeApp')
.factory('RPC', ['BaseFlowStencil', (BaseFlowStencil) ->
    return class RPC extends BaseFlowStencil
      @title: "RPC"
      @category: "Flow"
])