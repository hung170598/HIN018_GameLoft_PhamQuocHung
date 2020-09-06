extends RigidBody2D

var inGoal=false
var outOfBounds=false

func _ready():
	set_process(true)
	
func _process(delta):
	if outOfBounds:
		return
		
	if get_pos().y>1500:
		outOfBounds=true
		get_parent().died()
		get_parent().find_node("camera").stopped=true