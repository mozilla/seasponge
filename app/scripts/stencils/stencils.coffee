###*
 # @ngdoc service
 # @name seaspongeApp.Stencils
 # @description
 # # Stencils
 # Factory in the seaspongeApp.
###
angular.module('seaspongeApp')
.factory('Stencils', [
    'GenericTrustBoundaryStencil'
    'AuthorizationStencil'
    'BotStencil'
    'HumanUserStencil'
    'ServerStencil'
    'ServiceStencil'
    'WebBrowserStencil'
    'DesktopStencil'
    'LaptopStencil'
    'MobileWebBrowserStencil'
    'NativeApplicationStencil'
    'ProcessStencil'
    'ThreadStencil'
    'WebApplicationStencil'
    'CacheStencil'
    'DataStoreStencil'
    'DatabaseStencil'
    , ->
        return arguments;
])