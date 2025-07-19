extends Node2D

func _ready() -> void:
	ScreenTransition.fade_in()
	
func _on_button_pressed() -> void:
	LevelManager.restart_game()
