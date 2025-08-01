extends Node2D

const SPEED = 30

var direction = 1

@onready var raycast_right = $"raycast right"
@onready var raycast_left = $"raycast left"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if raycast_left.is_colliding():
		direction = 1
		$AnimatedSprite2D.flip_h = false
		
	if raycast_right.is_colliding():
		direction = -1
		$AnimatedSprite2D.flip_h = true
	
	position.x += direction * SPEED * delta
