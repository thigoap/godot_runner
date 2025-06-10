extends PlayerState

func EnterState():
	Name = "Run"
	
func ExitState():
	pass
	
func Update(delta: float):
	#Player.HandleJump()
	#Player.HandleDash()
	Player.HandleFalling()
	HandleAnimations()
	
func HandleAnimations():
	Player.animator.play("run")
