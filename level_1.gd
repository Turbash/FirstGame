extends Node2D

@onready var player = $Player
@onready var hud = $HUD

func _ready():
	hud.update_lives(LevelManager.lives)
	LevelManager.level_reset.connect(_on_reset)
	LevelManager.game_over.connect(_on_game_over)

	_reset_player()

func _reset_player():
	player.velocity = Vector2.ZERO
	player.can_move = true

func _on_spike_hit():
	player.can_move = false
	LevelManager.reset_level()

func _on_reset():
	await get_tree().create_timer(0.5).timeout
	_reset_player()
	hud.update_lives(LevelManager.lives)

func _on_game_over():
	hud.update_lives(0)
	await hud.show_game_over()
	await get_tree().create_timer(1.5).timeout
	LevelManager.restart_game()

func _on_goal_reached():
	player.can_move = false
	await hud.show_win()
	await get_tree().create_timer(1.5).timeout
	LevelManager.go_to_next_level()
