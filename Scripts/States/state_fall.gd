extends PlayerState

func EnterState():
	Name = 'Fall'
	
func ExitState():
	pass
	
func Update(delta: float):
	Player.HandleGravity(delta)
	Player.HandleLanding()
	HandleAnimations()

	
func HandleAnimations():
	Player.animator.play('fall')
