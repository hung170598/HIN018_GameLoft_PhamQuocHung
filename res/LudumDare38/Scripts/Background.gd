extends Node2D

var cam
var lastPos
var fac=.4

func _ready():
	cam=get_parent().find_node("camera")
	lastPos=cam.get_pos()-Vector2(Globals.get("display/width"),Globals.get("display/height"))*.5
	set_fixed_process(true)
	
func _fixed_process(delta):
	var nextPos=cam.get_pos()-Vector2(Globals.get("display/width"),Globals.get("display/height"))*.5
	lastPos+=(nextPos-lastPos)*fac
	set_pos(nextPos)