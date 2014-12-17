angular.module('seaspongeApp')
.factory('Binary', ['BaseFlowStencil', (BaseFlowStencil) ->
    return class Binary extends BaseFlowStencil
      @title: "Binary"
])