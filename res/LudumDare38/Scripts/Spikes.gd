extends Area2D

var samplePlayer

func _ready():
	samplePlayer=get_node("SamplePlayer")

func body_entered(body):
	if !body.is_in_group("player"):
		return#if colliding object is not player
		
	if body.inGoal:
		return
		
	var shards=find_node("Shards")
	shards.set_pos(Vector2(shards.get_pos().x, body.get_pos().y-get_pos().y))
	shards.set_emitting(true)
	var ball=get_parent().find_node("Ball")
	ball.set_hidden(true)
	ball.set_gravity_scale(0)
	ball.set_linear_velocity(Vector2())
	
	samplePlayer.play("crack_"+str(randi()%samplePlayer.get_sample_library().get_sample_list().size()))
	
	get_parent().died()