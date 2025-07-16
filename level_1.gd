extends Node2D

@onready var player = $Player
@onready var hud = $HUD

func _ready():
	hud.update_lives(LevelManager.lives)
	LevelManager.level_reset.connect(_on_reset)
	LevelManager.game_over.connect(_on_game_over)

func _on_spike_hit():
	LevelManager.reset_level()

func _on_reset():
	# Wait a bit before reload completes (optional visual delay)
	await get_tree().create_timer(0.5).timeout
	hud.update_lives(LevelManager.lives)

func _on_game_over():
	hud.update_lives(0)
	await hud.show_game_over()
	await get_tree().create_timer(1.5).timeout
	LevelManager.restart_game()

func _on_goal_reached():
	await hud.show_win()
	await get_tree().create_timer(1.5).timeout
	LevelManager.go_to_next_level()
