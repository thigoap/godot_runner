extends StaticBody2D

var speed = -450


func _physics_process(delta: float) -> void:
	var velocity = speed
	move_local_x(velocity * delta)


func _on_timer_timeout() -> void:
	queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	print('back laser: hit')
	queue_free()
