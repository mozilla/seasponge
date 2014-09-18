'use strict'

describe 'Controller: DrawCtrl', ->

  # load the controller's module
  beforeEach module 'seaspongeApp'

  DrawCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    DrawCtrl = $controller 'DrawCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
