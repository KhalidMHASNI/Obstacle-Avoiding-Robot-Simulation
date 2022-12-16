extends KinematicBody2D

export (int) var speed = 20
export (float) var rotation_speed = 1.5

var velocity = Vector2.ZERO
var rotation_dir = 0
var right_ws = 0
var left_ws = 0
var maxW = 20
var Vr = 0

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

func moveRightWheel():
	pass

func keepGoing():
	velocity = Vector2()
	if Input.is_action_just_pressed("ui_right"):
		right_ws += 1
		velocity = Vector2(speed * right_ws, 0)

		print("right wheel : ",right_ws)
	if Input.is_action_just_pressed("ui_left"):
		right_ws -= 1
		velocity = Vector2(speed * right_ws, 0)

		print("right wheel : ",right_ws)
	if Input.is_action_just_pressed("ui_up"):
		left_ws += 1

		print("left wheel : ",left_ws)
	if Input.is_action_just_pressed("ui_down"):
		left_ws -= 1

		print("left wheel : ",left_ws)
	if Input.is_action_just_pressed("ui_reset"):
		right_ws = 0
		left_ws = 0


func _physics_process(delta):
	#get_input()
	velocity = Vector2()
	if Input.is_action_just_pressed("ui_right"):
		right_ws += 1
		Vr = speed * right_ws

		print("right wheel : ",right_ws)
	if Input.is_action_just_pressed("ui_left"):
		right_ws -= 1
		Vr = speed * right_ws
		print("right wheel : ",right_ws)
	if Input.is_action_just_pressed("ui_up"):
		left_ws += 1

		print("left wheel : ",left_ws)
	if Input.is_action_just_pressed("ui_down"):
		left_ws -= 1

		print("left wheel : ",left_ws)
	if Input.is_action_just_pressed("ui_reset"):
		right_ws = 0
		left_ws = 0
		Vr = 0

	print(Vr)
	rotation += rotation_dir * rotation_speed * delta
	if (Vr!=0):
		move_and_collide(Vector2(Vr,0) * delta)	
	if (Vr==0):
		move_and_collide(Vector2.ZERO * delta)
	else :
		move_and_collide(Vector2(Vr,0) * delta)	
	
	
