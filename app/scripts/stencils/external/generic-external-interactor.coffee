angular.module('seaspongeApp')
.factory('GenericExternalInteractor', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class GenericExternalInteractor extends BaseExternalStencil
      @title: "Generic External Interactor"
      @category: "External"
])