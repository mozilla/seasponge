angular.module('seaspongeApp')
.factory('GeneralProcessStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class GeneralProcessStencil extends BaseProcessStencil
        @title: "General Process"
])
