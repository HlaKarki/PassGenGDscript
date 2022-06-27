extends Control

var _upperalphabetChars: = ["A", "B", "C", "D", "E", "F", "I", "J",
			  "K", "L", "M", "N", "O", "P","Q", "R",
			  "S", "T", "U", "V", "W", "X", "Y", "Z",
			  '!', '@', '#', '$', '&', '_']
							
var length: = 0
var genAmount: = 0
var _latestText: = ""

onready var richText = $RichTextLabel

func _ready():
	$LengthLineEdit.connect("text_changed", self, "_on_length_changed")
	$AmountLineEdit.connect("text_changed", self, "_on_amount_changed")
	

func _on_GenerateButton_pressed():
	generate(length, genAmount)
	
func _on_length_changed(new_text):
	length = int(new_text)
	
func _on_amount_changed(new_text):
	genAmount = int(new_text)


func generate(length: int, amount: int) -> void:
	for j in amount:
		for i in length:
			var UL = randi() % 2 + 1
			if UL == 1:
				_latestText += get_random_character(_upperalphabetChars)
			else:
				_latestText += get_random_character(_upperalphabetChars).to_lower()

		richText.add_text(_latestText + "\n")
		_latestText = ""

func get_random_character(arr1: Array) -> String:
		
	return arr1[get_random_number(0)]

func get_random_number(arrNumber: int) -> int:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	return int(rng.randf_range(0, _upperalphabetChars.size()))

func _on_LengthLineEdit_focus_entered():
	$LengthLineEdit.clear()

func _on_AmountLineEdit_focus_entered():
	$AmountLineEdit.clear()
