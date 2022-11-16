extends KinematicBody2D


var velocity = Vector2()
const acceleration = 400
const maxspeed = 100
const fricition = 400    

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * acceleration * delta
		velocity = velocity.clamped(maxspeed * delta)
	else :
		velocity = velocity.move_toward(Vector2.ZERO, fricition * delta)
	
	move_and_collide(velocity)

#Press_t = 100 * delta/120
