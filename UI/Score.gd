extends Control


# Declare member variables here. Examples:

var score = 0


onready var Score = $Score_Label




func _on_Trash_no_score(value):
	score = value
	if score != null:
		Score.text = "Score = "+str(score)
