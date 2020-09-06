extends Label

func _ready():
	set_process_input(true)
	
func _input(event):
	if event.type==InputEvent.KEY or event.type==InputEvent.MOUSE_BUTTON:
		if !event.is_pressed():
			get_tree().reload_current_scene()