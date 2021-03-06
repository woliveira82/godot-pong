extends KinematicBody2D


var speed = 250
var ball


func _ready():
	ball = get_parent().find_node("Ball")
	
	
func _physics_process(delta: float):
	move_and_slide(Vector2(0, get_opponent_direction()) * speed)
	

func get_opponent_direction():
	if abs(ball.position.y - position.y) > 25:
		return 1 if ball.position.y > position.y else -1
	else: return 0
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
