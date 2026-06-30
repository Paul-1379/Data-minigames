extends Node2D

@export var all_cats_images : Array[Texture]
@export var all_dogs_images : Array[Texture]

var is_cat_image : bool
var correct_answer = 0

func _ready() -> void:
	new_image()

func new_image() -> void:
	is_cat_image = randf()> 0.5
	var animal_image = all_cats_images.pick_random() if is_cat_image else all_dogs_images.pick_random()
	$"../Image".texture = animal_image

func _on_cat_button_pressed() -> void:
	if is_cat_image:
		new_correct_answer()
	else:
		Global.life_lost()
	new_image()
func new_correct_answer() -> void:
	correct_answer += 1
	$"../Number of correct answer".text = "correct answers: " + str(correct_answer)
	
	
func _on_dog_button_pressed() -> void:
	if not is_cat_image:
		new_correct_answer()
	new_image()
