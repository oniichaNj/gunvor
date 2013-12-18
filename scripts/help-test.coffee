# Description:
#   Show available commands
#
# Commands:
#   hubot help - Displays all of the help commands that Hubot knows about.
#
# URLS:
#   /hubot/help
#
# Notes:
#   Removed old help.coffee because that one was slow (hdd's fault i suppose)

module.exports = (robot) ->

  robot.respond /help\s*(.*)?$/i, (msg) ->
    user = msg.message.user.name
    
    helptext = ["Commands:", "aww - Display the picture from /r/aww", "debug - {user: <user object to send message to>}", "hn.top - refer to the top item on HTS RSS", "hn[i] - refer to the ith item on HTS RSS", "Anna 9gag me - Returns a random meme image", "Anna <user> doesn't have <role> role - Removes a role from a user", "Anna <user> has <role> role - Assigns a role to a user", "Anna <user> is a badass guitarist - assign a role to a user", "Anna <user> is not a badass guitarist - remove a role from a user", "Anna a <away_message>", "Anna animate me <query> - The same thing as `image me`, except adds a try to return an animated GIF instead.", "Anna away <away_message> - Sets you as 'away' and optionally sets a away message", "Anna ca - get the latest bitcoin BUY/SELL advice according to the EMA", "Anna fake event <event> - Triggers the <event> event for debugging", "Anna help - Displays all of the help commands that Anna knows about.", "Anna help <query> - Displays all help commands that match <query>.", "Anna hn top <N> - get the top N items on HTS RSS", "Anna image me <query> - The Original. Queries Google Images for <query>dom top result.", "Anna interject - It's called GNU/Linux!", "Anna map me <query> - Returns a map view of the area returned by query", "Anna mustache me <query> - Searches Google Images for the specified query and mustaches it", "Anna mustache me <url> - Adds a mustache to the specified URL.", "Anna pug bomb N - get N pugs", "Anna pug me - Receive a pug", "Anna return/r - Removes your away flag & away message", "Anna s <status_message>", "Anna s <username>", "Anna show storage - Display the contents that are persisted in the brain", "Anna show users - Display all users that Anna knows about", "Anna stallman - Returns a Richard Stallman fact.", "Anna status <status_message> - Sets your status to status_message.", "Anna status <username> - Tells you the status of username", "Anna the rules - Make sure Anna still knows the rules.", "Anna translate me <phrase> - Searches for a translation for the <phrasethat bad boy out.", "Anna translate me from <source> into <target> <phrase> - Translates <ce> into <target>. Both <source> and <target> are optional", "Anna what role does <user> have - Find out what roles are assigned to Anna who has admin role - Find out who's an admin and can assign roles", "Anna who is <user> - see what roles a user has", "Anna youtube me <query> - Searches YouTube for the query and returns url.", "it's a trap - Display an Admiral Ackbar piece of wonder", "ship it - Display a motivation squirrel"].join('\n')

    msg.send user + ": Please check your PM's for the help message."
    robot.send({user: {name: user}}, helptext)
