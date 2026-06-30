extends Node

var minigames_done = 0
var lives = 5

func life_lost() -> void:
	lives -= 1
	print(lives)
	if lives <= 0:
		get_tree().change_scene_to_file("res://Scenes/LevelScene.tscn")
