extends CharacterBody2D

const AIR_CONTROL_SPEED = 80.0
const BOUNCE_VELOCITY = -300.0
const WALL_JUMP_UPLIFT_VELOCITY=-300.0
const WALL_PUSH_OFF_VElOCITY=-400.0
var wall_jump_counter=0
var direction=1

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if is_on_floor():
		velocity.y = BOUNCE_VELOCITY

	direction = Input.get_axis("move_left", "move_right")
	
	if is_on_floor():
		wall_jump_counter=0
		velocity.x = 0  
	else:
		if direction != 0:
			velocity.x = direction * AIR_CONTROL_SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, AIR_CONTROL_SPEED)
	
	if is_on_wall():
		if wall_jump_counter==0:
			if Input.is_action_just_pressed("wall_jump"):	
				var push_off_dir=-1 if animated_sprite.flip_h else 1
				animated_sprite.flip_h=true if push_off_dir==1 else false
				velocity.x=WALL_PUSH_OFF_VElOCITY*push_off_dir
				velocity.y=WALL_JUMP_UPLIFT_VELOCITY
				wall_jump_counter=1

	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	move_and_slide()
