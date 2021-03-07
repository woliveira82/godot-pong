extends Node


var player_score = 0
var opponent_score = 0


func _ready():
	get_tree().call_group('BallGroup', 'stop_ball')
	$CountdownTimer.start()
	$CountDown.visible = true
	
	
func _on_Left_body_entered(body: Node):
	opponent_score += 1
	score_achieved()
	
	
func _on_Right_body_entered(body: Node):
	player_score += 1
	score_achieved()


func _process(delta: float):
	$PlayerScore.text = str(player_score)
	$OpponentScore.text = str(opponent_score)
	$CountDown.text = str(int($CountdownTimer.time_left) + 1)


func _on_CountdownTimer_timeout():
	get_tree().call_group('BallGroup', 'restart_ball')
	$CountdownTimer.stop()
	$CountDown.visible = false
	
	
func score_achieved():
	$Ball.position = Vector2(640, 360)
	get_tree().call_group('BallGroup', 'stop_ball')
	$CountdownTimer.start()
	$CountDown.visible = true
	$ScoreSound.play()
	$Player.position = Vector2(50, 360)
	$Opponent.position = Vector2(1230, 360)
