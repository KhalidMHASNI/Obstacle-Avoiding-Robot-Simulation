extends KinematicBody2D

export (int) var speed = 200
export (float) var rotation_speed = 1
var velocity = Vector2()
var rotation_dir = 0
#############################################
var delta_t = 0.1
var dis_entre_Roue = 5 #cm
var ray_Robot = 5 #cm
var ray_Roue = 2 #cm

var delta_w_Max = 20 #rad/s
var w_Max = 50 #rad/s
var w_D = 0
var w_G = 0

var dist_Droite = 0
var dist_Gauche = 0
var dist_Robot = 0
var rot_Robot = 0


func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_just_pressed("ui_right"):
		#rotation_dir += 1
		w_G +=(delta_w_Max)
		w_D -=(delta_w_Max)
	if Input.is_action_just_pressed("ui_left"):
		#rotation_dir -= 1
		w_D +=(delta_w_Max)
		w_G -=(delta_w_Max)
	if Input.is_action_just_pressed("ui_down"):
		w_D -=(delta_w_Max)
		w_G -=(delta_w_Max)
	if Input.is_action_just_pressed("ui_up"):
		w_D +=(delta_w_Max)
		w_G +=(delta_w_Max)
	if Input.is_action_just_pressed("ui_reset"):
		w_D =0
		w_G =0
	
func _physics_process(delta):
	get_input()
	dist_Droite = w_D * delta_t * ray_Roue
	dist_Gauche = w_G * delta_t * ray_Roue
	
	dist_Robot = (dist_Droite + dist_Gauche)/2
	rot_Robot = (dist_Gauche - dist_Droite)/(dis_entre_Roue*10)
	
	#print("La vitesse de la roue droite est : ",w_D)
	#print("La vitesse de la roue gauche est : ",w_G)
	
	rotation += rot_Robot * rotation_speed * delta_t
	
	if (dist_Robot!=0):
		#print(dist_Robot)
		$wL.text = str(w_G)
		$wD.text = str(w_D)
		velocity = (Vector2(dist_Robot,0)).rotated(rotation).clamped(delta_w_Max)
		print(velocity)
		move_and_collide(velocity*delta)
	if (dist_Robot==0):
		move_and_collide(Vector2.ZERO * delta)
		

func clamp(value, min_value, max_value):
	return max(min(value, max_value), min_value)
