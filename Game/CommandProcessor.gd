extends Node

func initialize(starting_room):
	pass

var commandError := "Unknown Command"

func process_command(input: String) -> String:
	input.to_lower()
	var words = input.split(" ", false)
	if words.size() == 0:
		return "No words were parsed."
	
	var firstWord = words[0]
	var secondWord = ""
	
	if words.size() > 1:
		secondWord = words[1]
	
	match firstWord:
		"go":
			return go(secondWord)
		"help":
			return help()
		_:
			return commandError


func go(secondWord: String) -> String:
	if secondWord == "":
		return "Go where?"
	
	return "You go to " + secondWord

func help() -> String:
	return "go [location] \nopen [what]"
