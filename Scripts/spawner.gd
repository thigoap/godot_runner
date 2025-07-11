extends Node

@onready var back_enemy_spawner: Marker2D = $"../BackEnemySpawner"
@onready var front_enemy_spawner: Marker2D = $"../FrontEnemySpawner"

const back_enemy = preload("res://Scenes/Prefabs/BackEnemy.tscn")
const front_enemy = preload("res://Scenes/Prefabs/FrontEnemy.tscn")

var back_enemy_on = false
var front_enemy_on = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	back_enemy_spawner.position.x += GameManager.game_speed
	front_enemy_spawner.position.x += GameManager.game_speed
	if not back_enemy_on:
		spawn_back_enemies()
		back_enemy_on = true
	if not front_enemy_on:
		spawn_front_enemies()
		front_enemy_on = true


func spawn_back_enemies():
	var random_delay = randf_range(1.0, 3.0)
	await get_tree().create_timer(random_delay).timeout
	var enemy = back_enemy.instantiate()
	print('wild back enemy appeared')
	enemy.global_position = back_enemy_spawner.global_position
	#print(enemy.global_position)
	get_parent().add_child(enemy)


func spawn_front_enemies():
	var random_delay = randf_range(1.0, 3.0)
	await get_tree().create_timer(random_delay).timeout
	var enemy = front_enemy.instantiate()
	print('wild front enemy appeared')
	enemy.global_position = front_enemy_spawner.global_position
	print(enemy.global_position)
	get_parent().add_child(enemy)
