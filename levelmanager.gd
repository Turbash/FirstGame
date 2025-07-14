extends Node

var current_level := 1
var total_levels := 2
var lives := 3

signal level_reset
signal game_over
signal next_level

func reset_level():
	lives -= 1
	if lives > 0:
		level_reset.emit()
	else:
		game_over.emit()

func restart_game():
	current_level = 1
	lives = 3
	get_tree().change_scene_to_file("res://level_1.tscn")

func go_to_next_level():
	current_level += 1
	if current_level > total_levels:
		get_tree().change_scene_to_file("res://win_screen.tscn")
	else:
		get_tree().change_scene_to_file("res://level_%d.tscn" % current_level)
