extends Node2D

var onNr=0
var slides=[]

func _ready():
	slides.append(find_node("story_01"))
	slides.append(find_node("story_02"))
	slides.append(find_node("story_03"))
	set_process_input(true)
	
func _input(event):
	if event.is_pressed():
		return
		
	if event.type==InputEvent.KEY or event.type==InputEvent.MOUSE_BUTTON:
		slides[onNr].set_hidden(true)
		onNr+=1
		if onNr>=slides.size():
			get_tree().change_scene("res://Scenes/level_01.scn")
		else:
			slides[onNr].set_hidden(false)