extends PanelContainer

class_name Room

@export var roomName: String = "Room Name"
@export var roomDescription: String = "Room Description"

var Exits: Dictionary = {}

func ConnectExit(direction: String, room):
	match direction:
		"west":
			Exits[direction] = room
			room.exits["east"] = self
		"east":
			Exits[direction] = room
			room.exits["west"] = self
		"north":
			Exits[direction] = room
			room.exits["south"] = self
		"south":
			Exits[direction] = room
			room.exits["north"] = self
		_:
			print("Tried to connect invalid direction: " + direction)
		
