extends Area2D

func _on_spike_body_entered(body):
	if body.name == "Player":
		get_parent()._on_spike_hit()
