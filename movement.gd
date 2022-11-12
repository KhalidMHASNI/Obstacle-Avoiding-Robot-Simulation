extends KinematicBody2D

var speed = 4 * 10
var rotation_speed = 1.5

var velocity = Vector2()
var rotation_dir = 0

func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(speed, 0).rotated(rotation)
	if Input.is_action_pressed("back_left"):
		rotation_dir -=1
		velocity = Vector2(speed, 0).rotated(rotation)
	if Input.is_action_pressed("back_right"):
		rotation_dir += 1
		velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	move_and_slide(velocity)

#Press_t = 100 * delta/120

"""
func get_input(delta):
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		rotation_dir -=1
		velocity = Vector2(speed, 0).rotated(rotation)
		delta_t += 100 * delta/120
		print(delta_t)
	if Input.is_action_pressed("ui_left"):
		rotation_dir += 1
		velocity = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed("back_right"):
		rotation_dir += 1
		velocity = Vector2(speed, 0).rotated(rotation)
	if Input.is_action_pressed("back_left"):
		rotation_dir -=1
		velocity = Vector2(-speed, 0).rotated(rotation)
	

"""
