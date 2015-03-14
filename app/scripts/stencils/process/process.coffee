angular.module('seaspongeApp')
.factory('ProcessStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class ProcessStencil extends BaseProcessStencil
        @title: "Process"
        @icon: "images/icons/category.svg"
])
