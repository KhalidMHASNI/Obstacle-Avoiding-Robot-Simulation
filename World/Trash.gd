extends StaticBody2D


# Declare member variables here. Examples:
var a = 0
var b = "Robot"
var rand_x = 0
var rand_y = 0
var l = [[128,128],[272,96],[124,249],[448,248],[128,128],[488,888]]

signal no_score(value)

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if (body.name==b):
		a+=1
		change_posi()
		emit_signal("no_score",a)
		print(a," ",rand_x," ",rand_y)

func change_posi():
	var i =  rand_range(0, 6)
	rand_x = l[i][0]
	rand_y = l[i][1]
	position = Vector2(rand_x, rand_y)
	
