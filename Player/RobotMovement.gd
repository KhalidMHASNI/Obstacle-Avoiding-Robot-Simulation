extends KinematicBody2D

export (float) var rotation_speed = 1
var velocity = Vector2()
var collider
#################################################################################
#           Initialiser les variable
#################################################################################

var delta_t = 0.1
var dis_entre_Roue = 5 #cm
var ray_Robot = 5 #cm
var ray_Roue = 2 #cm

var delta_w_Max = 20 #rad/s
var w_Max = 200 #rad/s
var w_D = 0
var w_G = 0

var dist_Droite = 0
var dist_Gauche = 0
var dist_Robot = 0
var rot_Robot = 0

#################################################################################
#           Fonction pour influencer sur les roue indépendament
#################################################################################

func one_wheel_input():
	velocity = Vector2()
	if Input.is_action_just_pressed("ui_right"):
		w_D +=(delta_w_Max)
	if Input.is_action_just_pressed("ui_left"):
		w_D -=(delta_w_Max)
	if Input.is_action_just_pressed("ui_down"):
		w_G -=(delta_w_Max)
	if Input.is_action_just_pressed("ui_up"):
		w_G +=(delta_w_Max)
	if Input.is_action_just_pressed("ui_reset"):
		w_D =0
		w_G =0

#################################################################################
#           Fonction pour influencer sur les roue en même temps
#################################################################################
func two_wheel_input():
	velocity = Vector2()
	if Input.is_action_just_pressed("ui_right"):
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

#################################################################
#           Fonction Générale du Robot
#################################################################
func _physics_process(delta):
	$"../Trash".connect("positionBut",self,"_on_Trash_positionBut")
	two_wheel_input()
	w_D = clamp(w_D,-w_Max,w_Max)
	w_G = clamp(w_G,-w_Max,w_Max)
	$vitess_ang_G.text = str(w_G)
	$vitess_ang_D.text = str(w_D)
	
	#	Distance parcourus par chaque roue
	dist_Droite = w_D * delta_t * ray_Roue
	dist_Gauche = w_G * delta_t * ray_Roue
	
	#	Calcul du distance et la rotaion avec chaque roue
	dist_Robot = (dist_Droite + dist_Gauche)/2
	rot_Robot = (dist_Gauche - dist_Droite)/(dis_entre_Roue*30) 
	
	
	#print("La vitesse de la roue droite est : ",w_D)
	#print("La vitesse de la roue gauche est : ",w_G)
	
	rotation += rot_Robot * delta_t
	
	if (dist_Robot!=0):
		velocity = (Vector2(dist_Robot,0)).rotated(rotation).clamped(w_Max)
		#print(velocity)
		move_and_collide(velocity*delta)
	if (dist_Robot==0):
		move_and_collide(Vector2.ZERO * delta)

#################################################################
#           Fonction qui arrête le robot s'il y a collision
#################################################################

func _on_Area2D_body_entered(body):
	if (!(body.get_name()=="Trash" or body.get_name()=="Trash1")):
		w_D = 0
		w_G = 0


func _on_Trash_positionBut(position):
	print(position)
