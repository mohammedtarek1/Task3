util = require "util"
twit = require "twitter"

twitter = new twit
  consumer_key: "IYG9MiWw7ZZ0p7iGaj9qCC32o"
  consumer_secret: "hsJn1e6iMyY5YgUbji7J1fE3Rss4RWazdbd8mlXr52DAbvLKAt"
  access_token_key: "628778911-pu2vCznQDumX01KiFVRXF1lp4peXQ3wX91xJYJVj"
  access_token_secret: "HAujOfgekDHQYqehv3NRINXzsSaTD6DruyOaJnDOsitja"

tweets = []
wordLength = process.argv.length
if wordLength < 3
  console.log "Command not found"
  process.exit 0
else
  word = process.argv.slice(2).toString()
twitter.stream "filter",
  track: word
, (stream) ->
  
  #listen stream data
  stream.on "data", (data) ->
    console.log "Search Result " + data.text
    tweets.push data
  
  stream.on "error", ->
    console.log "Error Fetching Data"
