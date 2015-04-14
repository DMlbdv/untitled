{file, config} = require 'rygr-util'
path = require 'path'
express = require 'express'
_ = require 'underscore'

# Load in configs
paths = ["#{path.join(__dirname, '..', 'config')}/*.json", 'config/*.json']

# console.log paths

config.initialize paths

# console.log config

# Call initializers
require('./initializers/main')()

# Setup Express app
app = express()

# Setup directories
dirs =
  base: __dirname
  public: path.resolve __dirname, '..', config.client.build.root
  assets: path.resolve __dirname, '..', config.client.build.assets
  database: path.resolve __dirname, '..', config.client.db

console.log dirs

app.set 'dirs', dirs


# Set middleware
require('./middleware/main') app

# Start listening
server = app.listen config.server.port, ->
  console.log "Server listening on port #{ config.server.port }"

# Make sure to shut down the server if the process is terminated
process.on 'SIGTERM', server.close

# Return the server
module.export = server
