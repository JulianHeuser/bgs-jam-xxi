extends CharacterBody2D

@export var speed = 300
var target_position = Vector2.ZERO

func _ready():
	target_position = global_position

func _physics_process(_delta):
	# Get the mouse click position
	if Input.is_action_just_pressed("left_click"):
		target_position = get_viewport().get_mouse_position()

	# Check if the player is far enough from the target to move
	if global_position.distance_to(target_position) > 3:
		var direction = (target_position - global_position).normalized()
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO # Stop if close enough

	move_and_slide()
