angular.module('seaspongeApp')
.factory('SMB', ['BaseFlowStencil', (BaseFlowStencil) ->
    return class SMB extends BaseFlowStencil
      @title: "SMB"
])