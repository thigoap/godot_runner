extends Node2D

#region variables
@onready var Camera = $Camera2D
@onready var Runner = $Runner
#@onready var Ground = $Ground

#const START_SPEED = 2
#const MAX_SPEED = 8
#const RUNNER_START_POS = Vector2i(150,128)
#const CAM_START_POS = Vector2i(160,90)
#endregion

# Called when the node enters the scene tree for the first time.
func _ready():
	LevelStart()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	Camera.position.x += GameManager.game_speed
	Runner.position.x += GameManager.game_speed


func LevelStart():
	pass
	#Runner.position = RUNNER_START_POS
	#Runner.velocity = Vector2i(0,0)
	#Camera.position = CAM_START_POS
	#Ground.position = Vector2i(0,0)
