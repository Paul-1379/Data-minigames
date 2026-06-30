extends Node

var minigames_done = 0
var lives = 5
var score = 0

const MAX_LIVES = 5

func reset() -> void:
	minigames_done = 0
	lives = MAX_LIVES
	score = 0
	
func life_lost() -> void:
	lives -= 1
	print(lives)
	if lives <= 0:
		get_tree().change_scene_to_file("res://Scenes/deadScreen.tscn")
