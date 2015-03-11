angular.module('seaspongeApp')
.factory('BotStencil', ['BaseExternalStencil', (BaseExternalStencil) ->
    return class BotStencil extends BaseExternalStencil
      @title: "Bot"
      @icon: "/images/icons/binary6.png"
])