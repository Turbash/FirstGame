extends Area2D

func _ready():
	$AnimationPlayer.play("move_left_right")

func _on_moving_trap_body_entered(body):
	if body.name == "Player":
		get_parent()._on_spike_hit()
