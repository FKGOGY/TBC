extends Node

signal response_generated(response_text)

var currentRoom = null

func initialize(starting_room):
	changeRoom(starting_room)

var commandError := "Unknown Command"

func process_command(input: String) -> String:
	var words = input.split(" ", false)
	if words.size() == 0:
		return "No words were parsed."
	
	var firstWord = words[0].to_lower()
	var secondWord = ""
	
	if words.size() > 1:
		secondWord = words[1].to_lower()
	
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


func changeRoom(new_room: Room):
	currentRoom = new_room
	var strings = PackedStringArray([
		"You go to " + new_room.roomName,
		new_room.roomDescription
	])
	emit_signal("response_generated", "\n".join(strings))
