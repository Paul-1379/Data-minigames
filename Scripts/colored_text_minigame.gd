extends Node2D

@export var text_color : Array[String]
@export var colors : Array[Color]

@export var colorRectButtons : Array[ColorRect]

var answer_number = 0
var correct_answer = 0
func _ready() -> void:
	refresh_question()

func refresh_question():
	var text = text_color.pick_random()
	var color = Color.DEEP_PINK
	while true:
		color = colors.pick_random()
		if colors.find(color) != text_color.find(text):
			break
	$"../Main text".text = "[center][font_size=60][color=" + str(color.to_html()) + "]" + text + "[/color]"
	answer_number = randi_range(0, 2)
	
	colorRectButtons[answer_number].color = colors[text_color.find(text)]
	var remainingColorRectButton = colorRectButtons.duplicate()
	remainingColorRectButton.remove_at(answer_number)
	var trap_on_right = randf() > 0.5
	
	var newColors = colors.duplicate()
	var text_color_index = text_color.find(text)
	var color_index = colors.find(color)
	#because removing color will shift the indexes of the next part of the array
	if text_color_index > color_index:
		text_color_index -= 1
	newColors.remove_at(colors.find(color))
	newColors.remove_at(text_color_index)
	if trap_on_right :
		remainingColorRectButton[0].color = newColors.pick_random()
		remainingColorRectButton[1].color = color
	else :
		remainingColorRectButton[0].color = color
		remainingColorRectButton[1].color = newColors.pick_random()

func new_correct_answer() -> void:
	correct_answer += 1
	$"../MinigameTimeLeft".current_score = correct_answer
	$"../Number of correct answer".text = "correct answers: " + str(correct_answer)

func _on_button_pressed(num:int) -> void:
	if num == answer_number:
		new_correct_answer()
	else:
		Global.life_lost()
	refresh_question()
	
func _on_left_button_pressed() -> void:
	_on_button_pressed(0)

func _on_middle_button_pressed() -> void:
	_on_button_pressed(1)

func _on_right_button_pressed() -> void:
	_on_button_pressed(2)
