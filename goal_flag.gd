extends Area2D

func _on_goalflag_body_entered(body):
	if body.name == "Player":
		body.can_move = false  # disable movement
		await get_tree().current_scene.get_node("HUD").show_win()
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://scenes/Level2.tscn")
