extends PlayerState

@onready var dash_timer: Timer = $"../../DashTimer"
@onready var runner: CharacterBody2D = $"../.."


func EnterState():
	Name = 'Dash'
	dash_timer.start()
	GameManager.game_bckp_speed = GameManager.game_speed
	GameManager.game_speed = 2 * GameManager.game_speed


func ExitState():
	runner.dashCollider.disabled = false
	GameManager.game_speed = GameManager.game_bckp_speed


func Update(_delta: float):
	Player.HandleFalling()
	HandleAnimations()


func HandleAnimations():
	Player.animator.play('dash')


func _on_dash_timer_timeout() -> void:
	if runner.current_state.name == 'Dash':
		runner.ChangeState(States.Run)
