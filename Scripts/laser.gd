extends Area2D

var speed = 450


func _physics_process(delta: float) -> void:
	var velocity = speed
	move_local_x(velocity * delta)


func _on_timer_timeout() -> void:
	queue_free()
