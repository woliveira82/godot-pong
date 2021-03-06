extends KinematicBody2D


var speed = 400


func _physics_process(delta: float):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1.0
		
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1.0
		
	move_and_slide(velocity * speed)


