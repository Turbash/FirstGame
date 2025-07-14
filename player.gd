extends CharacterBody2D

@export var gravity_force := 2000
@export var bounce_speed := 800
@export var wall_jump_speed := 700
@export var wall_jump_horizontal_boost := 500

var can_move = true
var wall_jumped = false
var last_wall_dir = 0  # -1 = left wall, 1 = right wall

func _physics_process(delta):
	if not can_move:
		return

	# Gravity
	if !is_on_floor():
		velocity.y += gravity_force * delta
	else:
		velocity.y = 0
		velocity.x = 0
		wall_jumped = false

	# Check which wall we're touching
	last_wall_dir = 0
	if is_on_wall():
		var left_check = test_move(global_transform, Vector2(-1, 0))
		var right_check = test_move(global_transform, Vector2(1, 0))
		if left_check:
			last_wall_dir = -1
		elif right_check:
			last_wall_dir = 1

	# Ground jump (space)
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		var dir_x := 0
		if Input.is_action_pressed("move_left"):
			dir_x = -1
		elif Input.is_action_pressed("move_right"):
			dir_x = 1

		var bounce_dir = Vector2(dir_x, -1).normalized()
		velocity = bounce_dir * bounce_speed

	# Wall jump (shift)
	elif !is_on_floor() and is_on_wall() and !wall_jumped and Input.is_action_just_pressed("wall_jump"):
		if last_wall_dir != 0:
			var jump_dir = Vector2(-last_wall_dir, -1).normalized()
			velocity = jump_dir * wall_jump_speed
			velocity.x = jump_dir.x * wall_jump_horizontal_boost
			wall_jumped = true

	move_and_slide()
