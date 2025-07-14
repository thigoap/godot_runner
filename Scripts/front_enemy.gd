extends CharacterBody2D

@onready var enemy_spawner: Node2D = $"../Spawner"
@onready var front_enemy_spawner: Marker2D = $"../FrontEnemySpawner"
@onready var front_enemy_pointer: Marker2D = $"../FrontEnemySpawner/FrontEnemyPointer"

var move_speed = 85
var positioning = true


func _process(delta: float) -> void:
	position_enemy(delta)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if 'LaserArea2D' in area.name:
		print('enemy down')
		enemy_spawner.front_enemy_on = false
		queue_free()


func position_enemy(delta):
	if positioning:
		self.global_position = self.global_position.move_toward(front_enemy_pointer.global_position, delta * move_speed)
	if self.global_position == front_enemy_pointer.global_position:
		positioning = false
		#self.position.x += GameManager.game_speed
