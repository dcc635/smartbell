define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')
  TimerOutputTemplate = require('hbs!template/timer/output')
  TimerOutputHhMmSsView = require('views/timer/output/HhMmSs')
  TimerOutputMsAnimationView = require('views/timer/output/msAnimation')


  class TimerOutputView extends Backbone.View

    initialize: ->
      @render()

    render: ->
      @$el.html(TimerOutputTemplate())
      @HhMmSs = new TimerOutputHhMmSsView(el: @$('.hh-mm-ss'), model: @model)
      @msAnimation = new TimerOutputMsAnimationView(el: @$('.ms-animation'), model: @model)
      @HhMmSs.render()
      @msAnimation.render()
      return this
