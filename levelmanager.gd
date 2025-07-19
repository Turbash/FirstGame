extends Node

var level_scenes = [
	"res://level_1.tscn",
	"res://level_2.tscn",
	"res://level_3.tscn"
]
var win_screen_scene = "res://win_screen.tscn"

var total_coins = 0            
var coins_at_level_start = 0   
var current_level_index=0

func update_level():
	coins_at_level_start = total_coins

func add_coin():
	total_coins += 1

func next_level():
	current_level_index+=1
	if current_level_index<=2:
		update_level()
		ScreenTransition.fade_to_scene(level_scenes[current_level_index])
	else:
		ScreenTransition.fade_to_scene(win_screen_scene)

func restart_level():
	total_coins = coins_at_level_start	

func restart_game():
	total_coins = 0
	coins_at_level_start = 0
	current_level_index=0
	ScreenTransition.fade_to_scene(level_scenes[0])
