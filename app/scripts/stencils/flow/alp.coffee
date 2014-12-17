angular.module('seaspongeApp')
.factory('ALP', ['BaseFlowStencil', (BaseFlowStencil) ->
    return class ALP extends BaseFlowStencil
      @title: "ALP"
      @category: "Flow"
])