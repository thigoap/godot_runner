extends CharacterBody2D

#region variables
@onready var sprite = $Sprite2D
@onready var animator = $AnimationPlayer
@onready var collider = $CollisionShape2D
@onready var dashCollider = $DashCollisionShape2D
@onready var States = $StateMachine

const GRAVITY = 700
const JUMP_VELOCITY = -250
const MAX_JUMPS = 1

var jumps = 0

var keyJumpPressed = false
var keyDashPressed = false
var keyShootBackPressed = false
var keyShootFrontPressed = false
var keyDropMinePressed = false

# State Machine
var current_state = null
var previous_state = null

#endregion

func _ready():
	# Initialize State Machine
	for state in States.get_children():
		state.States = States
		state.Player = self
	previous_state = States.Fall
	current_state = States.Fall

#func _draw():
	#current_state.Draw()

func _physics_process(delta):
	GetInputStates()
	current_state.Update(delta)
	
	HandleJump()
	HandleDash()
	HandleShoot()
	HandleMine()

	move_and_slide()
	velocity.x = 0


func ChangeState(next_state):
	if next_state != null:
		previous_state = current_state
		current_state = next_state
		previous_state.ExitState()
		current_state.EnterState()
		print('State Change from: ' + previous_state.Name + ' to ' + current_state.Name)


func GetInputStates():
	keyJumpPressed = Input.is_action_just_pressed("KeyJump")
	keyDashPressed = Input.is_action_just_pressed("KeyDash")
	keyShootBackPressed = Input.is_action_just_pressed("KeyShootBack")
	keyShootFrontPressed = Input.is_action_just_pressed("KeyShootFront")
	keyDropMinePressed = Input.is_action_just_pressed("KeyDropMine")


func HandleDash():
	if keyDashPressed and is_on_floor() and current_state.name != 'Dash':
		ChangeState(States.Dash)
		dashCollider.disabled = true
		await animator.animation_finished
		if current_state.name == 'Dash':
			ChangeState(States.Run)


func HandleJump():
	if keyJumpPressed and jumps < MAX_JUMPS:
		jumps += 1
		ChangeState(States.Jump)

func HandleGravity(delta, gravity: float = GRAVITY):
	if !is_on_floor():
		velocity.y += gravity * delta

func HandleFalling():
	if !is_on_floor():
		ChangeState(States.Fall)

func HandleLanding():
	if is_on_floor():
		jumps = 0
		ChangeState(States.Run)


func HandleShoot():
	if keyShootBackPressed:
		ChangeState(States.ShootBack)
		BackFromShoot()
	if keyShootFrontPressed:
		ChangeState(States.ShootFront)
		BackFromShoot()


func HandleMine():
	if keyDropMinePressed: 
		ChangeState(States.DropMine)
		BackFromShoot()

func BackFromShoot():
	await animator.animation_finished
	if current_state.name == 'ShootFront' \
	or current_state.name == 'ShootBack'  \
	or current_state.name == 'DropMine' :
		ChangeState(States.Run)
