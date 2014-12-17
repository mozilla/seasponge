'use strict'

describe 'Controller: LoadCtrl', ->

  # load the controller's module
  beforeEach module 'seaspongeApp'

  LoadCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    LoadCtrl = $controller 'LoadCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
