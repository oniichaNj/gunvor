# Description:
#   Bitcoin advice from RSS, which were sent from Gekko
#
# Dependencies:
#   "nodepie": "0.5.0"
#
# Configuration:
#   None
#
# Commands:
#   hubot ca - get the latest bitcoin BUY/SELL advice
#
# Author:
#   skimbrel, modified by willeponken for Bitcoin advice.

NodePie = require("nodepie")

caFeedUrl = "http://emails2rss.appspot.com/rss?id=f4f998f60ad33042f40a1360d8cb8e668dea"

module.exports = (robot) ->
  robot.respond /ca/i, (msg) ->
    msg.http(caFeedUrl).get() (err, res, body) ->
      if res.statusCode is not 200
        msg.send "Something's gone awry"
      else
        feed = new NodePie(body)
        try
          feed.init()
          item = feed.getItem(0)
          msg.send  item.getTitle() + " " + item.getDate()
        catch e
          console.log(e)
          msg.send "Something's gone awry"
