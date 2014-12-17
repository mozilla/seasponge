angular.module('seaspongeApp')
.factory('IOCTLInterface', ['BaseFlowStencil', (BaseFlowStencil) ->
    return class IOCTLInterface extends BaseFlowStencil
      @title: "IOCTL Interface"
])