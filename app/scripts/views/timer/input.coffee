define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')
  TimerInputTemplate = require('hbs!template/timer/input')
  TimerModel = require('models/timer')
  Formatting = require('formatting')


  class TimerInputView extends Backbone.View

    initialize: ->
      @listenTo(@model, "change:paused", @render)
      @$el.html(TimerInputTemplate(@model.get('startTime')))
      @delegateEvents
        'click button.start-pause': 'startPause'
        'click button.reset': 'reset'
        'keyup input': 'allow_only_numerals'
        'focusout input': 'format'

    startPause: ->
      if @model.get('paused')
        if @model.get('completed')
          @reset()
        @model.start()
      else
        @model.pause()

    reset: ->
      @model.set 'startTime',
        hours: $('.hours').val()
        minutes: $('.minutes').val()
        seconds: $('.seconds').val()
        milliseconds: 0
      @model.reset()

    format: ->
      for id in ['.hours', '.minutes', '.seconds']
        $(id).val(Formatting.padLeftZeros($(id).val(), 2))

    allow_only_numerals: ->
      for id in ['.hours', '.minutes', '.seconds']
        if (/\D/g.test($(id).val()))
          $(id).val($(id).val().replace(/\D/g, ''))

    focus: ->
      $(@select())

    render: ->
      if @model.get('paused')
        $('button.start-pause').html('Start')
      else
        $('button.start-pause').html('Pause')
      return this
