extends CharacterBody2D


const speed = 300.0
const JUMP_VELOCITY = -800.0
var input = Vector2.ZERO
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var camera : Camera2D
@onready var state_machine = $StateMachine
@onready var jump_state = $StateMachine/JumpState
@onready var walk_state = $StateMachine/WalkState
func _ready():
	
	walk_state.jumping.connect(state_machine.switch_state.bind(jump_state))
	jump_state.walking.connect(state_machine.switch_state.bind(walk_state))
	
func _physics_process(delta):
	
	var g = gravity * 2
	if Input.is_action_pressed("ui_accept"):
		g = gravity
	if not is_on_floor():
		velocity.y += g * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	camera.position.y = position.y - 800
	position.x = clamp(position.x, 0, 900)
	

	move_and_slide()
