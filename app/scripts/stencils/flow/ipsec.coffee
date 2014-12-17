angular.module('seaspongeApp')
.factory('IPsec', ['BaseFlowStencil', (BaseFlowStencil) ->
    return class IPsec extends BaseFlowStencil
      @title: "IPsec"
      @category: "Flow"
])