extends Node2D

@onready var score_label=$"ScoreLabel"
@onready var comment: Label = $Comment

func _ready() -> void:
	ScreenTransition.fade_in()
	var total_coins=LevelManager.total_coins
	score_label.text="You scored " + str(total_coins) + " points"
	if total_coins==21:
		comment.add_theme_color_override("font_color",Color.GREEN)
		comment.text="Damn!! You collected all the coins. Wait untill the next update for more challenges"
		
func _on_button_pressed() -> void:
	LevelManager.restart_game()
