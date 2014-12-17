angular.module('seaspongeApp')
.factory('HumanUser', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class HumanUser extends BaseExternalStencil
      @title: "Human User"
      @category: "External"
])