module.exports = (robot) ->
  robot.enter (response) ->

    # Get the name of the user who has just joined
    user = response.message.user.name

    # Store the greetings - we store this in an array because it's nicer to send
    # multiple messages than ugly multi-line ones
    greetings = [
      "...",
      "..."
    ]

    unless user == "Gunbor" # We don't want the bot to PM itself...
      # Send a private message to the person who has joined
      robot.send({user: {name: user}}, greeting) for greeting in greetings
