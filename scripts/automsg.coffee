module.exports = (robot) ->
	robot.hear /problem\??/i, (msg) ->
		msg.send "http://0-media-cdn.foolz.us/ffuuka/board/vp/image/1373/64/1373644195696.png"
    robot.hear /cake\??/i (msg) ->
        msg.send c.red "THE CAKE IS A LIE!"
    robot.hear /nano\??/i (msg) ->
       msg.send "Death 2 nano!"