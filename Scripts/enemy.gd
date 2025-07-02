extends CharacterBody2D

@onready var Enemy: CharacterBody2D = $"."


func _process(delta: float) -> void:
	#Enemy.position.x -= GameManager.game_speed
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	print('enemy down')
	queue_free()
