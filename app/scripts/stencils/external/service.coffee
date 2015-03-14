angular.module('seaspongeApp')
.factory('ServiceStencil', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class ServiceStencil extends BaseExternalStencil
      @title: "Service"
      @icon: "images/icons/sitemap1.svg"
])