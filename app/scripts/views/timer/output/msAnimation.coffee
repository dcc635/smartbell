define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')


  class TimerOutputMsAnimationView extends Backbone.View

    initialize: ->
      @listenTo(@model, "change:currentTime", @render)

    render: ->
      milliseconds = @model.get('currentTime').milliseconds
      amp = 100
      sin_position = 100 - 100 * Math.abs(Math.sin(milliseconds * Math.PI / 1000))
      position = 13 + (0.59 * sin_position)
      @$el.css
        'top': "#{ position }%"
      return this
      