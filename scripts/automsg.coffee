c = require('irc-colors')

module.exports = (robot) ->
  robot.hear /cake\??/i, (msg) ->
    msg.send c.red("THE CAKE IS A LIE!")
  robot.hear /nano\??/i, (msg) ->
    msg.send "Nano 4 Win!"
