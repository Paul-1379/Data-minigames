extends RichTextLabel

@export var refresh_time = 0.1
@export var take_text = true
var characters = 'abcdefghijklmnopqrstuvwxyz'
var correct_word = ""
func _ready() -> void:
	$AnimationPlayer.play("text_anim")
	
	if take_text:
		correct_word = text
	else:
		for i in range(480):
			correct_word += "="
		correct_word += "YOU_WON"
		for i in range(69):
			correct_word += "="
		correct_word += "YOUR_SCORE_IS:"+str(Global.score)
		for i in range(450):
			correct_word += "="
		
@export var probability = 0.0

func generate_random_text(chars, length):
	var word: String
	var n_char = len(chars)
	for i in range(length):
		if randf()<probability:
			word += correct_word[i]
		else:
			word += chars[randi()% n_char]
	return word
var time = 0
func _process(delta: float) -> void:
	time += delta
	if time > refresh_time:
		time = 0
		text = generate_random_text(characters, 1001)
