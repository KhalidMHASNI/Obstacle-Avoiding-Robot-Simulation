extends KinematicBody2D

var speed = 4

var Wd = 4                               # Vitesse angulaire droite à entrer
var Wg = 4                               # Vitesse angulaire gauche à entrer



var delta_t = 0.1
var velocity = Vector2()                  # x et y
var Rr = 50                               # en mm
var D = 50
var R0 = 20
var Wmax = 100
var Wacc = 2
var rotation_dir = 0

var Dd = Wd * 0.1 * R0 
var Dg = Wg * 0.1 * R0

var Dr = (Dd + Dg) /2
var rotation_speed = 0.5
var Dalpha = abs((Dd - Dg))/D

func _physics_process(delta):
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		#delta_t += 100 * delta/120
		#print(delta_t)
		rotation_dir -=1
		velocity = Vector2(Dd, 0).rotated(rotation)
		
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(Dr, 0)
		
	if Input.is_action_pressed("ui_left"):
		rotation_dir += 1
		velocity = Vector2(-Dd, 0).rotated(rotation)
		
	if Input.is_action_pressed("back_right"):
		rotation_dir += 1
		velocity = Vector2(Dg, 0).rotated(rotation)
	if Input.is_action_pressed("back_left"):
		rotation_dir -=1
		velocity = Vector2(-Dg, 0).rotated(rotation)
	#else : 
		#delta_t = 0
	
	rotation += rotation_dir * rotation_speed *delta_t
	velocity += velocity * Wacc
	velocity = velocity.clamped(Wmax)
	move_and_collide(velocity * delta)

#Press_t = 100 * delta/120
