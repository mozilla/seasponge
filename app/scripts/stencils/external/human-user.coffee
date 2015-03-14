angular.module('seaspongeApp')
.factory('HumanUserStencil', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class HumanUserStencil extends BaseExternalStencil
      @title: "Human User"
      @icon: "images/icons/user91.svg"
])