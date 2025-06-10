extends PlayerState

func EnterState():
	Name = "Dash"
	
func ExitState():
	pass
	
func Update(delta: float):
	Player.HandleFalling()
	HandleAnimations()
	
func HandleAnimations():
	Player.animator.play("dash")
