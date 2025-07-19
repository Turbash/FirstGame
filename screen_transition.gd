extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func fade_in():
	animation_player.play("fade_in")
	await animation_player.animation_finished
	self.visible=false
	
func fade_to_scene(scene_path:String):
		self.visible=true
		animation_player.play("fade_out")
		await animation_player.animation_finished
		get_tree().change_scene_to_file(scene_path)
