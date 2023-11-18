class_name WalkState
extends State

signal jumping

@export var player : CharacterBody2D

func _ready() -> void:
	set_physics_process(false)
func _enter() -> void:
	set_physics_process(true)
func _exit() -> void:
	set_physics_process(false)


func _physics_process(delta):
	
	var input = Input.get_axis("left", "right")
	player.velocity.x = input * 800
	print(input)
	if input != 0:
		Global.ground_speed += player.speed*delta
	else:
		if Global.ground_speed > 0:
			Global.ground_speed -= player.speed
