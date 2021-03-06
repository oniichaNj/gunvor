# Description:
#   HTS News
#
# Dependencies:
#   "nodepie": "0.5.0"
#
# Configuration:
#   None
#
# Commands:
#   hubot hn top <N> - get the top N items on HTS RSS
#   hn.top - refer to the top item on HTS RSS
#   hn[i] - refer to the ith item on HTS RSS
#
# Author:
#   skimbrel, slightly modified by willeponken for HTS RSS.

NodePie = require("nodepie")
c = require("irc-colors")

hnFeedUrl = "https://sms8.schoolsoft.se/hassleholm/jsp/public/right_public_student_rss.jsp?key=fcf94cbfa15407a4886415b75cdb754f"

module.exports = (robot) ->
  robot.respond /HN top (\d+)?/i, (msg) ->
    msg.http(hnFeedUrl).get() (err, res, body) ->
      if res.statusCode is not 200
        msg.send c.rainbow("Something's gone awry")
      else
        feed = new NodePie(body)
        try
          feed.init()
          count = msg.match[1] || 5
          items = feed.getItems(0, count)
          msg.send "(" + c.red(item.getDate()) + ") " + c.cyan(item.getTitle()) for item in items
        catch e
          console.log(e)
          msg.send c.rainbow("Something's gone awry")

  robot.hear /HN(\.top|\[\d+\])/i, (msg) ->
     msg.http(hnFeedUrl).get() (err, res, body) ->
       if res.statusCode is not 200
         msg.send c.rainbow("Something's gone awry")
       else
         feed = new NodePie(body)
         try
           feed.init()
         catch e
           console.log(e)
           msg.send c.rainbow("Something's gone awry")
         element = msg.match[1]
         if element == "HN.top"
           idx = 0
         else
           idx = (Number) msg.match[0].replace(/[^0-9]/g, '')
         try
           item = feed.getItems()[idx]
           msg.send "(" + c.red(item.getDate()) + ") " + c.cyan(item.getTitle())
         catch e
           console.log(e)
           msg.send c.rainbow("Something's gone awry")
