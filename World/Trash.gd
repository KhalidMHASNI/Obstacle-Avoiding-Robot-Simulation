extends StaticBody2D


var rand_x = 0
var rand_y = 0

var l = [[128,128],[272,96],[124,249],[448,248],[128,128],[488,888]]

signal no_score()

###########################################################################
#        Fonction qui appel une fonction pour changer la position du but 
#     et emit un signal vers le script du Score pour incrémenter ce dernier
###########################################################################
func _on_Area2D_body_entered(body):
	if (body.name=="Robot"):
		change_posi()
		emit_signal("no_score")

###########################################################################
#        Fonction qui change la position du but
###########################################################################
func change_posi():
	var i =  rand_range(0, 6)
	rand_x = l[i][0]
	rand_y = l[i][1]
	position = Vector2(rand_x, rand_y)
	
