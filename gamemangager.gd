extends Node

var score = 0

@onready var score_label =$ScoreLabel
@onready var win_label=$WinLabel

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " coins."

func show_win():
	score_label.show()
	win_label.show()
