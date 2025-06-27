extends CharacterBody2D

@onready var Enemy: CharacterBody2D = $"."
var speed = GameManager.game_speed


func _process(delta: float) -> void:
	Enemy.position.x += GameManager.game_speed
