extends CanvasLayer

signal start_game

var showing_title := true  # Used to hide title on click

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	showing_title = true

func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	$Message.text = "Restarting..."
	$Message.show()
	showing_title = true  # optional, for visibility

func show_win():
	show_message("You Win!")
	await $MessageTimer.timeout
	$Message.text = "Restarting..."
	$Message.show()
	showing_title = true

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func _on_message_timer_timeout():
	if showing_title:
		$Message.hide()

# 🖱️ Hide title message when player taps/clicks screen
func _input(event):
	if showing_title and event is InputEventMouseButton and event.pressed:
		$Message.hide()
		showing_title = false

func update_lives(lives):
	$LivesLabel.text = "Lives: %d" % lives
	
func hide_title():
	$Message.hide()
	showing_title = false
