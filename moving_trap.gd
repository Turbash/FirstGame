extends Area2D

func _ready():
	$AnimationPlayer.play("moving_horizontally")

func _on_moving_trap_body_entered(body):
	if body.name == "Player":
		get_parent()._on_spike_hit()
