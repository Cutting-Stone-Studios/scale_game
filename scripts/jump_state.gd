class_name JumpState
extends State

signal walking
func _ready() -> void:
	set_physics_process(false)
func _enter() -> void:
	set_physics_process(true)
func _exit() -> void:
	set_physics_process(false)

