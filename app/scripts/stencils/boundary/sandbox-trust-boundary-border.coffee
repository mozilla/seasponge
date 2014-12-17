angular.module('seaspongeApp')
.factory('SandboxTrustBoundaryBorder', ['BaseBoundaryStencil', (BaseBoundaryStencil) ->
    return class SandboxTrustBoundaryBorder extends BaseBoundaryStencil
      @title: "Sandbox Trust Boundary Border"
])