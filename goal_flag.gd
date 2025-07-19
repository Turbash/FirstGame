extends Area2D

@onready var GameManager=%GameManager

func _on_goalflag_body_entered(body):
	GameManager.show_win()
	await get_tree().create_timer(1.5).timeout
	LevelManager.next_level()
