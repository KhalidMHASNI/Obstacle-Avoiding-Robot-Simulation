extends Label



# Declare member variables here. Examples:
# var a = 2
var wR = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("ui_right"):
		wR+=1;
		text = str(wR);
	if Input.is_action_just_pressed("ui_left"):
		wR-=1;
		text = str(wR);
