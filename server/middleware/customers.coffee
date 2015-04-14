path = require 'path'
fs = require 'fs'
_ = require 'underscore'

module.exports = (app) ->
  dbDir = app.get('dirs').database

  (req, res, next) ->
    # a = []
    # a = req.path.split('/')
    # console.log a
    switch req.path.split('/').pop()
      when 'template.json'
        res.type('json').sendFile path.join dbDir, 'template.json'
      when 'customers'
        res.type('application').sendFile path.join dbDir, 'customers.json'
        console.log  "!"
      when 'customers:id=curr'
        data = JSON.stringify(req.body)
        res.send data
        fs.appendFile "#{dbDir}/customers.json", data, (err) ->
          console.log err
      else
        next()