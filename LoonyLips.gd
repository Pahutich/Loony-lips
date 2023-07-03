extends Control


func _ready():
	var prompts = ["Dima", "Minions", "greatest"]
	var story = "Once upon a time %s watched %s and thought it was the %s movie of the past two decades"
	story = story % prompts
	
	$DisplayText.text = story
