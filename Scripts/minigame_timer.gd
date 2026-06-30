extends Label

var current_score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	text = "Time left: " + str(snappedf($Timer.time_left, 0.1))


func _on_timer_timeout() -> void:
	Global.minigames_done += 1
	Global.score += current_score
	get_tree().change_scene_to_file("res://Scenes/LevelScene.tscn")
