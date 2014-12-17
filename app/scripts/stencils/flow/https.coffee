angular.module('seaspongeApp')
.factory('HTTPS', ['BaseFlowStencil', (BaseFlowStencil) ->
    return class HTTPS extends BaseFlowStencil
      @title: "HTTPS"
])