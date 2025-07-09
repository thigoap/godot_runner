extends Node2D

#region variables
@onready var Camera = $Camera2D
@onready var Runner = $Runner
@onready var Ground = $Ground
@onready var Distance: Label = $Camera2D/HUD/Distance
@onready var starting_position = Camera.position.x
@onready var distance_ran = 0

#const START_SPEED = 2
#const MAX_SPEED = 8
#const RUNNER_START_POS = Vector2i(116,219)
#const CAM_START_POS = Vector2i(240,135)
#endregion

# Called when the node enters the scene tree for the first time.
func _ready():
	LevelStart()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	Camera.position.x += GameManager.game_speed
	Runner.position.x += GameManager.game_speed
	#Ground.position.x -= GameManager.game_speed
	distance_ran = abs(Camera.position.x - starting_position) * 0.1
	Distance.text = "Distance: %.2f" %distance_ran


func LevelStart():
	var previous_x = Runner.position.x
	#Runner.position = RUNNER_START_POS
	#Runner.velocity = Vector2i(0,0)
	#Camera.position = CAM_START_POS
	#Ground.position = Vector2i(0,0)
