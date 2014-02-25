# Description:
#  Complain whenever user drops the F-Bomb
#
# Commands:
#   (fuck|fan|helvete) - OH NO YOU DIDN'T
#
# Notes:
#   swear words make anna cry

string = "Oh no you didn't!"

module.exports = (robot) ->
  robot.hear /\b(fuck|fan|helvete)\b/i, (msg) ->
    text = msg.message.text
    msg.send string

