angular.module('seaspongeApp')
.factory('HTTP', ['BaseFlowStencil', (BaseFlowStencil) ->
    return class HTTP extends BaseFlowStencil
      @title: "HTTP"
])