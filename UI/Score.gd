extends Control


var score = 0

# variable du label score (Text)
onready var Score = $Score_Label

#################################################################
#        Reception du signale du Trash1 et incrementer le score
#################################################################
func _on_Trash_no_score():
	add_Score(1)

#################################################################
#        Reception du signale du Trash2 et incrementer le score
#################################################################
func _on_Trash1_no_score1():
	add_Score(1)
	
#############################################################################################################
#        Fonction qui somme le totale des scores et les ajouts dans le Label Score ($Score_Label)
#############################################################################################################
func add_Score(v):
	score += v
	if score != null:
		Score.text = "Score = "+str(score)
