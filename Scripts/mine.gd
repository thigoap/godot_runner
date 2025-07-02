extends Node

@onready var mine: RigidBody2D = $"."


func _physics_process(delta: float) -> void:
	mine.position.x -= GameManager.game_speed


func _on_area_2d_area_entered(area: Area2D) -> void:
	print('hit')
	queue_free()
