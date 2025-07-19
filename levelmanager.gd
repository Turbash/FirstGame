extends Node

var total_coins=0

var level_scenes=[
	"res://level_1.tscn",
	"res://level_2.tscn",
	"res://level_3.tscn",
	"res://level_4.tscn"	
]

var win_screen_scene="res://win_screen.tscn"

var current_level_index=0

func add_coin():
	total_coins+=1
	print("coins collected:",total_coins)
	
func next_level():
	current_level_index+=1
	if(current_level_index<=3):
		get_tree().change_scene_to_file(level_scenes[current_level_index])
	else:
		show_win()
	
func show_win():
	get_tree().change_scene_to_file(win_screen_scene)

func restart_game():
	current_level_index=0
	total_coins=0
	get_tree().change_scene_to_file(level_scenes[0])
