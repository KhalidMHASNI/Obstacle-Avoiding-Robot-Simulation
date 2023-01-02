extends StaticBody2D


# Declare member variables here. Examples:
var a = 0
var b = "Robot"
var rand_x = randf()
var rand_y = randf()


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
	rand_x = (rand_x - 0.5) * 2
	rand_y = (rand_y- 0.5) * 2
	position = Vector2(rand_range(-100, 100), rand_range(-100, 100))
	
