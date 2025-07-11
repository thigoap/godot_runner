extends PlayerState

@onready var runner: CharacterBody2D = $"../.."
@onready var mine_marker_2d: Marker2D = $"../../BackMarker2D"
const MINE = preload("res://Scenes/Prefabs/Mine.tscn")

func EnterState():
	Name = 'DropMine'
	var mine = MINE.instantiate()
	mine.global_position = mine_marker_2d.global_position
	get_parent().add_child(mine)

func ExitState():
	pass
	
func Update(_delta: float):
	Player.HandleFalling()
	HandleAnimations()
	
func HandleAnimations():
	Player.animator.play('drop mine')
