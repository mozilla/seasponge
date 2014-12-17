angular.module('seaspongeApp')
.factory('FileSystem', ['BaseStoreStencil', (BaseStoreStencil) ->
    return class FileSystem extends BaseStoreStencil
      @title: "File System"
])