extends LineEdit

func _ready():
	# Focus on Input on start
	grab_focus()

func _on_text_submitted(_new_text):
	clear()
