extends Label


# Declare member variables here. Examples:
# var a = 2
var wL = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		wL+=1;
		text = str(wL);
