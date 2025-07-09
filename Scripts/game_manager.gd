extends Node

var in_game = false
var paused = false
var game_speed: float = 2
var game_bckp_speed: float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	# if Input.is_action_just_pressed('pause') and in_game:
		# pause_unpause()

func pause_unpause():
	var pause_menu = $"../World/UI/PauseMenu"
	if paused:
		pause_menu.hide()
		#Engine.time_scale = 1
		get_tree().set_pause(false)
	else:
		pause_menu.show()
		#Engine.time_scale = 0
		get_tree().set_pause(true)
	paused = !paused
