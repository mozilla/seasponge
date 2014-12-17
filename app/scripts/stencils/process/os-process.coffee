angular.module('seaspongeApp')
.factory('OSProcessStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class OSProcessStencil extends BaseProcessStencil
        @title: "OS Process"
])