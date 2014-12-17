'use strict'

describe 'Controller: CreateCtrl', ->

  # load the controller's module
  beforeEach module 'seaspongeApp'

  CreateCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    CreateCtrl = $controller 'CreateCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
