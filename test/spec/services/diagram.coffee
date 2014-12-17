'use strict'

describe 'Service: Diagram', ->

  # load the service's module
  beforeEach module 'seaspongeApp'

  # instantiate service
  Diagram = {}
  beforeEach inject (_Diagram_) ->
    Diagram = _Diagram_

  it 'should do something', ->
    expect(!!Diagram).toBe true
