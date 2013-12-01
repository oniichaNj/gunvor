# Description:
#   Generates help commands for Hubot.
#
# Commands:
#   hubot help - Displays all of the help commands that Hubot knows about.
#   hubot help <query> - Displays all help commands that match <query>.
#
# URLS:
#   /hubot/help
#
# Notes:
#   These commands are grabbed from comment blocks at the top of each file.

module.exports = (robot) ->

  robot.respond /help\s*(.*)?$/i, (msg) ->

    user = msg.message.user.name

    cmds = robot.helpCommands()
    filter = msg.match[1]

    if filter
      cmds = cmds.filter (cmd) ->
        cmd.match new RegExp(filter, 'i')
      if cmds.length == 0
        msg.send "No available commands match #{filter}"
        return

    prefix = robot.alias or robot.name
    cmds = cmds.map (cmd) ->
      cmd = cmd.replace /^hubot/, prefix
      cmd.replace /hubot/ig, robot.name

    emit = cmds.join "\n"

    helptexts = [emit]

    msg.send({user: {name: user}}, replymsg) for helptext in helptexts