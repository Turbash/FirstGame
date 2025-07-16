extends CharacterBody2D

const AIR_CONTROL_SPEED = 80.0
const BOUNCE_VELOCITY = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Auto-bounce when hitting the floor
	if is_on_floor():
		velocity.y = BOUNCE_VELOCITY

	# Get direction input (-1, 0, 1)
	var direction = Input.get_axis("move_left", "move_right")

	# Sprite flipping (still useful mid-air)
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	# Animations
	if is_on_floor():
		animated_sprite.play("idle")  # Could change to "bounce" animation if you have one
	else:
		animated_sprite.play("jump")

	# Movement control
	if is_on_floor():
		velocity.x = 0  # Disable movement on ground
	else:
		# Limited mid-air control
		if direction != 0:
			velocity.x = direction * AIR_CONTROL_SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, AIR_CONTROL_SPEED)

	move_and_slide()
