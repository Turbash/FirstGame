extends Node2D

@onready var player = $Player

func _ready():
	LevelManager.level_reset.connect(_on_reset)
	LevelManager.game_over.connect(_on_game_over)

func _on_spike_hit():
	LevelManager.reset_level()

func _on_reset():
	await get_tree().create_timer(0.5).timeout

func _on_game_over():
	await get_tree().create_timer(1.5).timeout
	LevelManager.restart_game()

func _on_goal_reached():
	await get_tree().create_timer(1.5).timeout
	LevelManager.go_to_next_level()
