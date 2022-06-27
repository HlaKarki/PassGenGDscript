extends Control

var _upperalphabetChars: = ["A", "B", "C", "D", "E", "F", "I", "J",
			  "K", "L", "M", "N", "O", "P","Q", "R",
			  "S", "T", "U", "V", "W", "X", "Y", "Z"]

var _loweralphabetChars: = ['a','b','c','d','e','f','g',
							'h','i','j','k','l','m','n',
							'o','p','q','r','s','t','u',
							'v','w','x','y','z']
							
var _specialChars: = ['!', '@', '#', '$', '&', '_']

var length: = 0
var genAmount: = 0
var _genCount: = 0

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
			_latestText += get_random_character(_upperalphabetChars, _loweralphabetChars, _specialChars)

		richText.add_text(_latestText + "\n")
		_latestText = ""

func get_random_character(arr1: Array, arr2: Array, arr3: Array) -> String:
	
	var _newChar: = ""
	var randomNum = get_random_number(0, true)
	
	if randomNum == 0:
		_newChar = arr1[get_random_number(0, false)]
	
	elif randomNum == 1:
		_newChar = arr2[get_random_number(1, false)]
	
	else:
		_newChar = arr3[get_random_number(2, false)]
	
	return _newChar

func get_random_number(arrNumber: int, normalNum: bool) -> int:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var randomNumber 
	
	if normalNum == false:
		var n: = 0
		if(arrNumber == 0 || arrNumber == 1):
			n = _upperalphabetChars.size()
		else:
			n = _specialChars.size()
		
		randomNumber = int(rng.randf_range(0, n))
	else:
		randomNumber = int(rng.randf_range(0,3))
	
	return randomNumber

func _on_LengthLineEdit_focus_entered():
	$LengthLineEdit.clear()

func _on_AmountLineEdit_focus_entered():
	$AmountLineEdit.clear()


"""
func generate(length: int, amount: int) -> void:
	randomize()
	password = "" 
	while password.length() < length:
		var select = randi() % arr1.size()
		var UL = randi() % 2 + 1
		if UL == 1:
			password += arr1[select].to_lower()
		
"""
