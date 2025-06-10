extends Node2D

#region variables
@onready var Camera = $Camera2D
@onready var Runner = $Runner
@onready var Ground = $Ground

const START_SPEED = 2
const MAX_SPEED = 8
const RUNNER_START_POS = Vector2i(40,156)
const CAM_START_POS = Vector2i(160,90)

@export var speed : float
#endregion

# Called when the node enters the scene tree for the first time.
func _ready():
	NewGame()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Camera.position.x += speed
	Runner.position.x += speed

func NewGame():
	Runner.position = RUNNER_START_POS
	#Runner.velocity = Vector2i(0,0)
	Camera.position = CAM_START_POS
	Ground.position = Vector2i(0,0)
