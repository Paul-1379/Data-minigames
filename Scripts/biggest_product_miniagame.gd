extends Node2D

@export var product_buttons : Array[Button] 

var answer_index = 0
var correct_answer = 0

func _ready() -> void:
	product_buttons.assign(get_tree().get_nodes_in_group("product_buttons"))
	for product_button in product_buttons:
		product_button.pressed.connect(product_button_pressed.bind(product_buttons.find(product_button)))
	put_random_products()

func product_button_pressed(index: int) -> void:
	if index == answer_index:
		new_correct_answer()
	else:
		Global.life_lost()
	put_random_products()

func new_correct_answer() -> void:
	correct_answer += 1
	$"../MinigameTimeLeft".current_score = correct_answer
	$"../Number of correct answer".text = "correct answers: " + str(correct_answer)


func put_random_products() -> void:
	var first_num_product = []
	var second_num_product = []
	var current_max_product = 0
	var current_product = 0
	var used_products = []
	for i in range(10):
		var first_num = randi_range(1, 10)
		var second_num = randi_range(1, 10)
		if not first_num * second_num in used_products:
			first_num_product.append(first_num)
			second_num_product.append(second_num)
			used_products.append(first_num * second_num)
	var i = 0
	for product_button in product_buttons:
		product_button.text = str(first_num_product[i]) + " x " + str(second_num_product[i])
		current_product = first_num_product[i] * second_num_product[i]
		if current_product > current_max_product:
			current_max_product = current_product
			answer_index = i
		i += 1
