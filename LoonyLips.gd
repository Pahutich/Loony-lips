extends Control


func _ready():
	var prompts = ["Dima", "Minions", "greatest"]
	var story = "Once upon a time %s watched %s and thought it was the %s movie of the past two decades"
	story = story % prompts
	
#	$VBoxContainer/PlayerText.text = story

func _on_PlayerText_text_entered(new_text):
	update_DisplayText(new_text)
	
func _on_TextureButton_pressed():
	var words = $VBoxContainer/HBoxContainer/PlayerText.text
	update_DisplayText(words)
	
func update_DisplayText(words):
	$VBoxContainer/DisplayText.text = words
	$VBoxContainer/HBoxContainer/PlayerText.clear()


