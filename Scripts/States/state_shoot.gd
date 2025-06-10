extends PlayerState

func EnterState():
	Name = "Shoot"
	
func ExitState():
	pass
	
func Update(delta: float):
	Player.HandleFalling()
	HandleAnimations()
	
func HandleAnimations():
	Player.animator.play("shoot")
