extends KinematicBody2D

const ACCEL = 50
const MAXSPEED = 130
const SPEED = 1
const FRIC = 220
var velocity = Vector2.ZERO

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCEL * delta
		velocity = velocity.clamped(MAXSPEED * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRIC * delta)

	move_and_collide(velocity)
