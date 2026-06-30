extends Button

func _on_pressed() -> void:
	Global.reset()
	get_tree().change_scene_to_file("res://Scenes/LevelScene.tscn")
