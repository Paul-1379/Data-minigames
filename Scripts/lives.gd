extends HBoxContainer

@export var livesIcons : Array[TextureRect]

var current_lives_count_displayed

func _process(_delta: float) -> void:
	if Global.lives != current_lives_count_displayed:
		current_lives_count_displayed = Global.lives
		var i = 0
		while i < Global.MAX_LIVES:
			if i < current_lives_count_displayed:
				livesIcons[i].show()
			else:
				livesIcons[i].hide()
			i += 1
