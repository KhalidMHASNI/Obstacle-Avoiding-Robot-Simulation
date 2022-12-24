extends Label



# Declare member variables here. Examples:
# var a = 2
var wR = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/World/YSort/Robot".connect("my_signal",self,"test")
	
func test():
	print("my_signal")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#if Input.is_action_just_pressed("ui_right"):
	#	wR+=1;
	#	text = str(wR);
	#if Input.is_action_just_pressed("ui_left"):
	#	wR-=1;
	#	text = str(wR);

