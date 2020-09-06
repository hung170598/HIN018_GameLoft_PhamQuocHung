extends Node2D

var ball

var speedMultiplier=3#factor by which the mousedifference is multiplied to get the final impulse

var shot=false
var ballOffset=Vector2(-45, -27)
var mouseDown=null

var samplePlayer

func _ready():
	samplePlayer=get_node("SamplePlayer2D")
	
	ball=get_parent().find_node("Ball")
	ball.set_pos(get_pos()+ballOffset)
	ball.set_gravity_scale(0)#make body stationary
	
	set_process(true)
	set_process_input(true)
	
func _process(delta):
	if(shot):
		return
		
	if(mouseDown!=null):
		ball.set_pos(get_pos()+ballOffset)#later adjust position according to trajectory
	else:
		ball.set_pos(get_pos()+ballOffset)

func viewToWorld(vec):
	var camPos=get_parent().find_node("camera").get_global_pos()-Vector2(Globals.get("display/width"),Globals.get("display/height"))*.5
	return vec+camPos

func clicked(event):
	if(shot):
		return
		
	#handle mousedown only if its inside area
	if (event.type==InputEvent.MOUSE_BUTTON):
		if(event.button_index!=BUTTON_LEFT):
			return
		
		if(event.is_pressed()):
			mouseDown=get_pos()+ballOffset;

func _input(event):
	if(shot):
		return
		
	#handle mouseup in any case
	if mouseDown==null:
		return
		
	if (event.type==InputEvent.MOUSE_BUTTON):
		if(event.button_index!=BUTTON_LEFT):
			return
		if(event.is_pressed()):
			return
		
		var vel=mouseDown-viewToWorld(event.pos)
		vel*=speedMultiplier
		
		ball.set_gravity_scale(1)#reapply gravity
		ball.apply_impulse(Vector2(), vel)
		#random torque
		ball.set_angular_velocity((randf()*2-1)*PI)
		
		samplePlayer.play("shot_"+str(randi()%samplePlayer.get_sample_library().get_sample_list().size()))
		
		shot=true