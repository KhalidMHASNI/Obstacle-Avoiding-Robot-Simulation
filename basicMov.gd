extends KinematicBody2D

export (int) var speed = 20
export (float) var rotation_speed = 1.5
var velocity = Vector2.ZERO
var rotation_dir = 0
var right_ws = 0
var left_ws = 0
var maxW = 20
var Vr = 0
var Vl=0
###############################################
var delta_t = 0.1
var dis_Roue = 5 #cm
var ray_Robot = 5 #cm
var ray_Roue = 2 #cm
var w_Max = 10 #rad/s
var delta_w_Max = 2 #rad/s

var dist_Droite = 0
var dist_Gauche = 0



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
	if Input.is_action_just_pressed("ui_right"):
		right_ws += 1
		Vr = speed * right_ws
		dist_Droite = Vr * delta_t * ray_Roue
		
		print("right wheel : ",right_ws)
	if Input.is_action_just_pressed("ui_left"):
		right_ws -= 1
		Vr = speed * right_ws
		dist_Droite = Vr * delta_t * ray_Roue
		print("right wheel : ",right_ws)
	if Input.is_action_just_pressed("ui_up"):
		left_ws += 1
		Vl = speed * left_ws
		dist_Gauche = Vl * delta_t * ray_Roue
		print("left wheel : ",left_ws)
	if Input.is_action_just_pressed("ui_down"):
		left_ws -= 1
		Vl = speed * left_ws
		dist_Gauche = Vl * delta_t * ray_Roue
		print("left wheel : ",left_ws)
	if Input.is_action_just_pressed("ui_reset"):
		right_ws = 0
		left_ws = 0
		Vr = 0


func _physics_process(delta):
	keepGoing()
	#print(Vr)
	rotation +=  (dist_Droite+dist_Gauche)/ray_Robot * delta
	print("dist_Droite : ",dist_Droite)
	print("dist_Gauche : ",dist_Gauche)
	if (Vr!=0 and Vl!=0):

		velocity = (Vector2(0,0)).rotated(rotation)
		move_and_collide(velocity*delta)
	if (Vr==0 and Vl==0):
		move_and_collide(Vector2.ZERO * delta)
	else :
		move_and_collide(Vector2(Vr,0) * delta)	
