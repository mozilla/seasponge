angular.module('seaspongeApp')
.factory('HTML5LocalStorage', ['BaseStoreStencil', (BaseStoreStencil) ->
    return class HTML5LocalStorage extends BaseStoreStencil
      @title: "HTML5 Local Storage"
])