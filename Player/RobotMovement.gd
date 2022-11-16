extends KinematicBody2D


var velocity = Vector2()    

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		
		velocity.x += 4
		
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 4
		
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 4  
	if Input.is_action_pressed("ui_down"):
		velocity.y += 4  
		#delta_t = 0
	
	move_and_collide(velocity)

#Press_t = 100 * delta/120
