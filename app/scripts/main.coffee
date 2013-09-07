#global require
"use strict"
require.config
  shim:
    underscore:
      exports: "_"

    backbone:
      deps: [
        "underscore",
        "jquery",
      ]
      exports: "Backbone"

    bootstrap:
      deps: ["jquery"]
      exports: "jquery"

    modernizr:
      exports: 'Modernizr'

  paths:
    backbone: "../bower_components/backbone-amd/backbone"
    bootstrap: "vendor/bootstrap"
    d3: "../bower_components/d3/d3.min"
    handlebars: "../bower_components/require-handlebars-plugin/Handlebars"
    hbs: "../bower_components/require-handlebars-plugin/hbs"
    i18nprecompile: "../bower_components/require-handlebars-plugin/hbs/i18nprecompile"
    jquery: "../bower_components/jquery/jquery"
    json2: "../bower_components/require-handlebars-plugin/hbs/json2"
    modernizr: "../bower_components/modernizr/modernizr"
    moment: "../bower_components/moment/moment"
    underscore: "../bower_components/underscore-amd/underscore"


require ["app"], (App) ->

  App.initialize()
