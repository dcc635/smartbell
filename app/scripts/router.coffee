define (require) ->

  $ = require('jquery')
  _ = require('underscore')
  Backbone = require('backbone')
  TimerModel = require('models/timer')
  TimerView = require('views/timer')


  class AppRouter extends Backbone.Router

    initialize: ->
      @timerModel = new TimerModel()
      @timerView = new TimerView(model: @timerModel)

    routes: ->
      '': 'timer'

    timer: ->
      $('#timers').html(@timerView.render().el)


  initialize: ->
    appRouter = new AppRouter()
