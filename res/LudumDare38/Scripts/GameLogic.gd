extends Node2D

func _ready():
	set_process_input(true)
	
func died():
	#instantiate destroyed overlay
	var node=load("res://Scenes/destroyed.scn").instance()
	find_node("camera").add_child(node)

func _input(event):
	if event.type==InputEvent.KEY and !event.is_pressed():
		if event.scancode==KEY_R:
			get_tree().reload_current_scene()
		elif event.scancode==KEY_M:
			var mp=get_node("/root/MusicPlayer").get_child(0)
			mp.set_paused(!mp.is_paused())
		elif event.scancode==KEY_E:
			go_back()

func go_back():
	var curr=get_tree().get_current_scene().get_name()
	if curr.casecmp_to("main_menu")==0:
		#exit game
		get_tree().quit()
	elif  curr.match("level_select_*"):
		get_tree().change_scene("res://Scenes/main_menu.scn")
	else:
		#in level, go back to select screen
		get_tree().change_scene("res://Scenes/level_select_01.scn")