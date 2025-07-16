extends Area2D

@onready var Gamemangager=%GameManager
@onready var animation_player=$AnimationPlayer

func _on_body_entered(body):
	Gamemangager.add_point()	
	animation_player.play("pickup")
