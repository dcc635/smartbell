define (require) ->
  
  $ = require('jquery')
  _ = require('underscore')
  Backbone = require('backbone')
  Router = require('router')

  initialize = ->
    Router.initialize()
    Backbone.history.start()

  return {
    initialize: initialize
  }
  