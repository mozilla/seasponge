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
    'ngAnimate'
    'ngCookies'
    'ngResource'
    'ngRoute'
    'ngSanitize'
    'ngTouch'
    'ui.bootstrap'
    'ui.select'
    'ngDragDrop'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainController'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutController'
      .when '/draw',
        templateUrl: 'views/draw.html'
        controller: 'DrawController'
      .otherwise
        redirectTo: '/'
