path = require 'path'
_ = require 'underscore'

module.exports = (app) ->
  pubDir = app.get('dirs').public

  (req, res, next) ->

    if req.accepts('html') and not _(req.path).startsWith('/assets/') and not _(req.path).startsWith '/database/'
      res.type('html').sendFile path.join pubDir, 'index.html'
      # console.log "#{req.path} gdmn"
    else
      next()