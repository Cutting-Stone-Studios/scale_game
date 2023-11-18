extends ParallaxBackground

@onready var sprite = $ParallaxLayer/Ground

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Global.ground_speed > 0:
		sprite.region_rect.position.x = Global.ground_speed

