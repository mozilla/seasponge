angular.module('seaspongeApp')
.factory('LaptopStencil', ['BaseProcessStencil', (BaseProcessStencil) ->
    return class LaptopStencil extends BaseProcessStencil
        @title: "Laptop Computer"
        @icon: "images/icons/blogging.svg"
])
