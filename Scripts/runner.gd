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

var keyJump = false
var keyJumpPressed = false
var keyDash = false
var keyDashPressed = false
var keyShootPressed = false

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

func _draw():
	current_state.Draw()

func _physics_process(delta):
	GetInputStates()
	current_state.Update(delta)
	
	HandleJump()
	HandleDash()
	HandleShoot()

	move_and_slide()


func ChangeState(next_state):
	if next_state != null:
		previous_state = current_state
		current_state = next_state
		previous_state.ExitState()
		current_state.EnterState()
		print('State Change from: ' + previous_state.Name + ' to ' + current_state.Name)

func GetInputStates():
	#keyJump = Input.is_action_pressed("KeyJump")
	#keyDash = Input.is_action_pressed("KeyDash")
	keyJumpPressed = Input.is_action_just_pressed("KeyJump")
	keyDashPressed = Input.is_action_just_pressed("KeyDash")
	keyShootPressed = Input.is_action_just_pressed("KeyShoot")


func HandleDash():
	if keyDashPressed and is_on_floor() and current_state.name != 'Dash':
		ChangeState(States.Dash)
		dashCollider.disabled = true


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
	if keyShootPressed:
		ChangeState(States.Shoot)
