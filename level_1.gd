extends Node2D

@onready var hud = $HUD
@onready var player = $Player

var lives = 3

func _ready():
	hud.update_lives(lives)
	hud.connect("start_game", Callable(self, "_on_start_game"))

func _on_spike_hit():
	player.can_move = false
	lives -= 1
	if lives > 0:
		hud.update_lives(lives)
		await get_tree().create_timer(0.8).timeout
		reset_level()
	else:
		hud.update_lives(0)
		await hud.show_game_over()
		await get_tree().create_timer(1.5).timeout
		restart_game()



func reset_level():
	player.position = Vector2(240, 600)
	player.velocity = Vector2.ZERO
	player.can_move = true  # ✅ enable movement again

func restart_game():
	lives = 3
	hud.update_lives(lives)
	reset_level()
	hud.hide_title()

	
func _on_start_game():
	lives = 3
	hud.update_lives(lives)
	reset_level()
	hud.hide_title()


func _on_goal_reached():
	await hud.show_win()
	await get_tree().create_timer(1.5).timeout
	restart_game()
