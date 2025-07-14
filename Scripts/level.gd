extends Node2D

#region variables
@onready var Camera = $Camera2D
@onready var Runner = $Runner
@onready var Ground = $Ground
@onready var Distance: Label = $Camera2D/HUD/Distance
@onready var starting_position = -180 #Ground node x start position
@onready var distance_ran = 0
#endregion

# Called when the node enters the scene tree for the first time.
func _ready():
	LevelStart()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#Camera.position.x += GameManager.game_speed
	#Runner.position.x += GameManager.game_speed
	Ground.position.x -= GameManager.game_speed
	distance_ran = abs(Ground.position.x + starting_position) * 0.1
	Distance.text = "Distance: %.2f" %distance_ran


func LevelStart():
	pass
