extends Node2D

@export var color_buttons : Array[Button] 

var answer_index = 0
var correct_answer = 0

func _ready() -> void:
	color_buttons.assign(get_tree().get_nodes_in_group("color_buttons"))
	for color_button in color_buttons:
		color_button.pressed.connect(color_button_pressed.bind(color_buttons.find(color_button)))
	put_random_colors()

func color_button_pressed(index: int) -> void:
	if index == answer_index:
		new_correct_answer()
	else:
		Global.life_lost()
	put_random_colors()

func new_correct_answer() -> void:
	correct_answer += 1
	$"../MinigameTimeLeft".current_score = correct_answer
	$"../Number of correct answer".text = "correct answers: " + str(correct_answer)


func put_random_colors() -> void:
	var color = _generate_random_hsv_color()
	var different_color = color
	different_color.h = different_color.h + (-0.1 if randf()>0.5 else 0.1)
	for color_button in color_buttons:
		color_button.modulate = color
	var different_color_button = color_buttons.pick_random()
	different_color_button.modulate = different_color
	answer_index = color_buttons.find(different_color_button)

func _generate_random_hsv_color() -> Color:
	return Color.from_hsv(
	randf(), # HUE
	randf_range(0.7, 0.9), # SATURATION
	randf_range(0.9, 1.0), # BRIGHTNESS
 )
