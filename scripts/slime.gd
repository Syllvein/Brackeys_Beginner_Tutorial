extends Node2D

const SPEED = 30

var direction = 1

@onready var raycast_right = $"raycast right"
@onready var raycast_left = $"raycast left"
@onready var raycast_downright = $"raycast downright"
@onready var raycast_downleft = $"raycast downleft"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# If the enemy hits a wall, turn around.
	if raycast_left.is_colliding():
		direction = 1
		$AnimatedSprite2D.flip_h = false
	
	if raycast_right.is_colliding():
		direction = -1
		$AnimatedSprite2D.flip_h = true
	
	# If the enemy comes to a ledge, turn around.
	if raycast_downleft.is_colliding() == false:
		direction = 1
		$AnimatedSprite2D.flip_h = false
	
	if raycast_downright.is_colliding() == false:
		direction = -1
		$AnimatedSprite2D.flip_h = true
		
	position.x += direction * SPEED * delta
