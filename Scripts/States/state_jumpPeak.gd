extends PlayerState

func EnterState():
	Name = "JumpPeak"
	
func ExitState():
	pass
	
func Update(delta: float):
	Player.ChangeState(States.Fall)
	
func HandleAnimations():
	pass
