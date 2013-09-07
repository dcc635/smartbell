define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')
  TimerTallyTemplate = require('hbs!template/timer/tally')

  class TimerTallyView extends Backbone.View

    initialize: ->
      @listenTo(@model, "change:tally", @render)

    render: ->
      @$el.html(TimerTallyTemplate(tally: @model.get('tally')))
      return this
      