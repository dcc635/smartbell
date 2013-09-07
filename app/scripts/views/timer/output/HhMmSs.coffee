define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')
  TimerOutputHhMmSsTemplate = require('hbs!template/timer/output/HhMmSs')
  Formatting = require('formatting')


  class TimerOutputHhMmSsView extends Backbone.View

    initialize: ->
      @listenTo(@model, "change:currentTime", @render)

    padLeftZeros: (number, padding) ->
      numberStr = '' + number
      while numberStr.length < padding
        numberStr = '0' + numberStr
      return numberStr

    render: ->
      @$el.html TimerOutputHhMmSsTemplate
        hours: Formatting.padLeftZeros(@model.get('currentTime').hours, 2)
        minutes: Formatting.padLeftZeros(@model.get('currentTime').minutes, 2)
        seconds: Formatting.padLeftZeros(@model.get('currentTime').seconds, 2)
      return this
