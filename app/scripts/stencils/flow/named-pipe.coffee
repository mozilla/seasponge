angular.module('seaspongeApp')
.factory('NamedPipe', ['BaseFlowStencil', (BaseFlowStencil) ->
    return class NamedPipe extends BaseFlowStencil
      @title: "Named Pipe"
      @category: "Flow"
])