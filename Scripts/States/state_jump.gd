extends PlayerState

func EnterState():
	Name = "Jump"
	Player.velocity.y = Player.JUMP_VELOCITY
	
func ExitState():
	pass
	
func Update(delta: float):
	Player.HandleGravity(delta)
	HandleJumpToFall()
	HandleAnimations()
	
func HandleJumpToFall():
	if (Player.velocity.y >= 0):
		Player.ChangeState(States.JumpPeak)
	
func HandleAnimations():
	Player.animator.play("jump")
