'use strict'

###*
 # @ngdoc overview
 # @name seaspongeApp
 # @description
 # # seaspongeApp
 #
 # Main module of the application.
###
angular
  .module('seaspongeApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'ui.bootstrap'
    'ui.select'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      .when '/draw',
        templateUrl: 'views/draw.html'
        controller: 'DrawCtrl'
      .otherwise
        redirectTo: '/'
