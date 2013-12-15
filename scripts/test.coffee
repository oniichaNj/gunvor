module.exports = (robot) ->
	robot.hear /problem\??/i, (msg) ->
		msg.send "Problem? http://puu.sh/5NKJw.jpg"
