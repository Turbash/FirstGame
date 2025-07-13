extends CharacterBody2D

@export var gravity_force := 2000
@export var bounce_speed := 800

var can_move = true  # by default, player can move

func _physics_process(delta):
	# Gravity
	if not can_move:
		return  # ignore movement input if disabled

	if not is_on_floor():
		velocity.y += gravity_force * delta
	else:
		velocity.y = 0  # Stop falling on ground
		velocity.x=0

	# Bounce input
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		var dir_x := 0
		if Input.is_action_pressed("move_left"):
			dir_x = -1
		elif Input.is_action_pressed("move_right"):
			dir_x = 1

		var bounce_dir = Vector2(dir_x, -1).normalized()
		velocity = bounce_dir * bounce_speed

	move_and_slide()
