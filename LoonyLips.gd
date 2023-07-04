extends Control

var player_words = []
var template = [
		{
		"prompts" : ["a name", "a noun", "adverb", "adjective"],
		"story" : "Once upon a time someone called %s ate a %s flavoured sandwich which made him feel all %s inside. It was a %s day "
		},
		{
		"prompts" : ["a verb", "adjective", "a noun", "a verb"],
		"story" : "I was doing %s and it felt %s. A little did I know that a %s was %s nearby"
		}
		]
var current_story

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText
onready var Label = $VBoxContainer/HBoxContainer/Label

func _ready():
	set_current_story()
	DisplayText.text = "Welcome to Loony Lips! We are going to tell a story and have a wonderful time! "
	check_player_words_length()
	PlayerText.grab_focus()
	
func set_current_story():
	randomize()
	current_story = template[randi() % template.size()]

func _on_PlayerText_text_entered(new_text):
	add_to_player_words()
	
func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()

func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ""
	PlayerText.clear()
	check_player_words_length()

func is_story_done():
	return player_words.size() == current_story.prompts.size()
	
func check_player_words_length():
	if is_story_done():
		end_game()
	else:
		prompt_player()
		
func tell_story():
	DisplayText.text = current_story.story % player_words
	
func prompt_player():
	DisplayText.text += "May I have " + current_story.prompts[player_words.size()] + " please?"

func end_game():
	PlayerText.queue_free()
	Label.text = "Again"
	tell_story()
