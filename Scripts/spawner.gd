extends Node

@onready var back_enemy_spawner: Marker2D = $"."

const front_enemy = preload("res://Scenes/Prefabs/Enemy.tscn")

func _ready():
	await get_tree().create_timer(1).timeout
	var enemy = front_enemy.instantiate()
	enemy.global_position = back_enemy_spawner.global_position
	#print(enemy.global_position)
	get_parent().add_child(enemy)

#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("KeyShootFront"):
		#var enemy = front_enemy.instantiate()
		#enemy.global_position = front_enemy_spawner.global_position
		#print(enemy.global_position)
		#get_parent().add_child(enemy)
