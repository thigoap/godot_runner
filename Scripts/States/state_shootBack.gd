extends PlayerState

@onready var runner: CharacterBody2D = $"../.."
@onready var shoot_marker_2d: Marker2D = $"../../BackMarker2D"
const LASER = preload("res://Scenes/Prefabs/BackLaser.tscn")

func EnterState():
	Name = 'ShootBack'
	var laser = LASER.instantiate()
	laser.global_position = shoot_marker_2d.global_position
	get_parent().add_child(laser)


func ExitState():
	pass


func Update(_delta: float):
	Player.HandleFalling()
	HandleAnimations()


func HandleAnimations():
	Player.animator.play('shoot back')
