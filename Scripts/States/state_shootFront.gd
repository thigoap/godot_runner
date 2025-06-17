extends PlayerState

func EnterState():
	Name = 'ShootFront'
	
func ExitState():
	pass
	
func Update(_delta: float):
	Player.HandleFalling()
	HandleAnimations()
	
func HandleAnimations():
	Player.animator.play('shoot front')
