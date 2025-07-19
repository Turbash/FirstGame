extends Node2D

@onready var score_label=$"ScoreLabel"

func _ready() -> void:
	var total_coins=LevelManager.total_coins
	score_label.text="You scored " + str(total_coins) + " points"



func _on_button_pressed() -> void:
	LevelManager.restart_game()
