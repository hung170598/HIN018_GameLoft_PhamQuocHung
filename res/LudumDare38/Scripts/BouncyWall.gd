extends Node2D

var samplePlayer

func _ready():
	samplePlayer=get_node("SamplePlayer")

func ball_entered_left(body):
	ball_entered(body, Vector2(-1,0))

func ball_entered_right(body):
	ball_entered(body, Vector2(1,0))
	
func ball_entered(body, n):
	if !body.is_in_group("player"):
		return#if colliding object is not player
		
	var normal=n.rotated(get_global_rot())#get_transform().affine_inverse().xform(n).normalized()
	var reflected=reflect(body.get_linear_velocity(),normal)
	#print(normal)
	body.set_linear_velocity(reflected)
	body.set_angular_velocity(-body.get_angular_velocity())
	
	samplePlayer.play("bump_"+str(randi()%samplePlayer.get_sample_library().get_sample_list().size()))
	
func reflect(d, n):
	return d-2*d.dot(n)*n