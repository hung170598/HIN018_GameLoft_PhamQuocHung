extends Node2D

var samplePlayer

func _ready():
	samplePlayer=get_node("SamplePlayer")
	
	set_process(true)
	set_process_input(true)

func _process(delta):
	pass

func ball_entered(body):
	if !body.is_in_group("player"):
		return#if colliding object is not player
		
	if body.inGoal:
		return
		
	var splash=find_node("Splash")
	splash.set_pos(Vector2(body.get_pos().x-get_pos().x,splash.get_pos().y))
	splash.set_emitting(true)
	var ball=get_parent().find_node("Ball")
	ball.set_hidden(true)
	ball.set_gravity_scale(0)
	ball.set_linear_velocity(Vector2())
	
	samplePlayer.play("water_"+str(randi()%samplePlayer.get_sample_library().get_sample_list().size()))
	
	get_parent().died()

func _input(event):
	if event.type==InputEvent.KEY and event.scancode==KEY_T:
		pass#use for testing