'use strict'

describe 'Service: model', ->

  # load the service's module
  beforeEach module 'seaspongeApp'

  # instantiate service
  model = {}
  beforeEach inject (_model_) ->
    model = _model_

  it 'should do something', ->
    expect(!!model).toBe true
