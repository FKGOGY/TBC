extends Control

const Response = preload("res://Game/Response.tscn")
const InputResponse = preload("res://Game/InputResponse.tscn")

@onready var historyRows = $Background/MarginContainer/Rows/GameInfo/Scroll/HistoryRows
@onready var scroll = $Background/MarginContainer/Rows/GameInfo/Scroll
@onready var scrollBar = scroll.get_v_scroll_bar()
@onready var command_processor = $CommandProcessor
@onready var room_manager = $RoomManager

var max_scroll_length := 0
@export var max_line_remembered: int = 15


func _ready() -> void:
	scrollBar.changed.connect(_on_scroll_size_changed)
	max_scroll_length = scrollBar.max_value
	
	handle_response_generated("Hey, type 'Help' to see available commands.")
	
	command_processor.response_generated.connect(handle_response_generated)
	command_processor.initialize(room_manager.get_child(0))


func _on_scroll_size_changed():
	if max_scroll_length != scrollBar.max_value:
		max_scroll_length = scrollBar.max_value
		scrollBar.value = max_scroll_length


func _on_input_text_submitted(new_text: String) -> void:
	if new_text.is_empty():
		return
	
	var input_response := InputResponse.instantiate()
	var response = command_processor.process_command(new_text)
	input_response.set_text(new_text, response)
	add_response_to_game(input_response)

func handle_response_generated(response_text: String):
	var response = Response.instantiate()
	response.text = response_text
	add_response_to_game(response)

func add_response_to_game(response: Control):
	historyRows.add_child(response)
	delete_history_to_limit()

func delete_history_to_limit():
	if historyRows.get_child_count() > max_line_remembered:
		var row_to_forget = historyRows.get_child_count() - max_line_remembered - 1
		historyRows.get_child(row_to_forget).queue_free()
