extends Node2D

@export var minigames_scenes : Array[PackedScene]
@export var minigames_done_text_node : RichTextLabel
@export var current_score_text_node : RichTextLabel
func _ready() -> void:
	minigames_done_text_node.text = "Minigames done: " + str(Global.minigames_done) +"/" + str(minigames_scenes.size())
	current_score_text_node.text = "Current score: " + str(Global.score)
func _on_timer_timeout() -> void:
	if Global.minigames_done < minigames_scenes.size():
		get_tree().change_scene_to_packed(minigames_scenes[Global.minigames_done])
	else:
		get_tree().change_scene_to_file("res://Scenes/WinScreen.tscn")
