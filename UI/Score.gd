extends Control


# Declare member variables here. Examples:

var score = 0

onready var Score = $Score_Label


func _on_Trash_no_score(value):
	if (value!=null):
		add_Score(1)


func _on_Trash1_no_score1(value1):
	if (value1!=null):
		add_Score(1)
	
func add_Score(v):
	score += v
	if score != null:
		Score.text = "Score = "+str(score)
