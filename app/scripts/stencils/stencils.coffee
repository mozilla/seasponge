angular.module('seaspongeApp')
.factory('Stencils', [
    'BrowserClientStencil'
    'GeneralProcessStencil'
    'KernelThreadStencil'
    'ManagedStencil'
    'NativeStencil'
    'OSProcessStencil'
    'ThickStencil'
    'ThreadStencil'
    'VirtualStencil'
    'WebServerStencil'
    'WebServiceStencil'
    'WebStencil'
    'Win32ServiceStencil'
    'WindowsStoreProcessStencil'
    , ->
        return arguments;
])