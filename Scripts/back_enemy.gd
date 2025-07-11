extends CharacterBody2D

@onready var enemy_spawner: Node2D = $"../Spawner"
@onready var back_enemy_spawner: Marker2D = $"../BackEnemySpawner"
@onready var back_enemy_pointer: Marker2D = $"../BackEnemySpawner/BackEnemyPointer"

var move_speed = 250
var positioning = true


func _process(delta: float) -> void:
	position_enemy(delta)


func _on_area_2d_area_entered(area: Area2D) -> void:
	print('enemy down')
	enemy_spawner.back_enemy_on = false
	queue_free()


func position_enemy(delta):
	if positioning:
		self.global_position = self.global_position.move_toward(back_enemy_pointer.global_position, delta * move_speed)
	if self.global_position == back_enemy_pointer.global_position:
		positioning = false
		self.position.x += GameManager.game_speed
