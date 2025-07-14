extends Node



func _physics_process(delta: float) -> void:
	self.position.x -= GameManager.game_speed


func _on_area_2d_area_entered(area: Area2D) -> void:
	print('mine: hit')
	queue_free()
