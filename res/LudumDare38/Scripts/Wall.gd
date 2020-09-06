extends StaticBody2D

var samplePlayer

func _ready():
	samplePlayer=get_node("SamplePlayer2D")
	
func hit(body):
	if !body.is_in_group("player"):
		return#if colliding object is not player
		
	samplePlayer.play("thump_"+str(randi()%samplePlayer.get_sample_library().get_sample_list().size()).pad_zeros(2))
