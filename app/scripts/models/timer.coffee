define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')
  Moment = require('moment')

  Timestamp = (@hours = 0, @minutes = 0, @seconds = 0, @milliseconds = 0) ->

  class TimerModel extends Backbone.Model

    defaults:
      startTime: new Timestamp
      currentTime: new Timestamp
      tally: 0
      paused: true
      completed: true

    initialize: (@refreshMs = 70) =>
      @audioElement = document.createElement('audio')
      @audioElement.setAttribute('src', 'http://cd.textfiles.com/10000soundssongs/WAV/DING1.WAV')
      @reset()

    playSound: () ->
      @audioElement.play()

    getElapsed: (momentLast = @momentLast, momentNow = Moment()) ->
      if not momentLast
        return 0
      elapsed = momentNow.diff(momentLast)
      @momentLast = momentNow
      return elapsed

    saveDuration: ->
      @set 'currentTime',
        hours: Math.floor(@duration.asHours())
        minutes: @duration.minutes()
        seconds: @duration.seconds()
        milliseconds: @duration.milliseconds()

    continueTimer: =>
      @interval = setTimeout(@refresh, @refreshMs)

    refresh: =>
      elapsed = @getElapsed()
      @duration = @duration.subtract(elapsed, 'ms')
      if @duration.asMilliseconds() > 0
        @continueTimer()
      else
        @completePomodoro()
      @saveDuration()

    pause: =>
      @set({paused: true})
      if @interval
        clearTimeout(@interval)

    completePomodoro: ->
      @duration = Moment.duration(0)
      @pause()
      @playSound()
      @set('tally', @get('tally') + 1)
      @set('completed', true)

    start: =>
      if @get('completed')
        @reset()
        @set('completed', false)
      @set({paused: false})
      @momentLast = Moment()
      @interval = setTimeout(@refresh, @refreshMs)

    reset: ->
      @pause()
      @duration = Moment.duration(@get('startTime'))
      @saveDuration()
