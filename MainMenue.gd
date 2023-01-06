extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#################################################################
#     Lorsque le boutton Start est cliqué le scene (World) se lance
#################################################################
func _on_start_pressed():
	get_tree().change_scene("res://World.tscn")

#################################################################
#        Lorsque le boutton Options est cliqué le scene (World) se lance
#################################################################
func _on_options_pressed():
	pass # Replace with function body.

#################################################################
#        Lorsque le boutton Quit est cliqué le jeu est quitté
#################################################################
func _on_quit_pressed():
	get_tree().quit()
