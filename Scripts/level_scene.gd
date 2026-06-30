extends Node2D

@export var minigames_scenes : Array[PackedScene]

func _ready() -> void:
	$"Minigames done number".text = "Minigames done: " + str(Global.minigames_done) +"/" + str(minigames_scenes.size())
	$"Current score".text = "Current score: " + str(Global.score)
func _on_timer_timeout() -> void:
	if Global.minigames_done < minigames_scenes.size():
		get_tree().change_scene_to_packed(minigames_scenes[Global.minigames_done])
	else:
		get_tree().change_scene_to_file("res://Scenes/WinScreen.tscn")
