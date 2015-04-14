{config, file} = require 'rygr-util'
path = require 'path'
_ = require 'underscore'
express = require 'express'
bodyParser = require 'body-parser'


module.exports = (app) ->
  app.use require('./assets') app
  app.use require('./client') app
  app.use bodyParser.json({ type: 'application/json' })
  app.use require('./customers') app
  app.use require('./missing') app
  app.use require('./error') app
