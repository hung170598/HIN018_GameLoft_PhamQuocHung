extends Sprite

var t=0
var period=4
var startPos
var amp=5.0
var rotOffset
var startRot
var rotAmp=PI*.005

func _ready():
	t=randf()*period
	rotOffset=randf()
	startPos=get_pos().y
	startRot=get_rot()
	set_process(true)
	
func _process(delta):
	t+=delta*(2*PI)/period
	set_pos(Vector2(get_pos().x, startPos+sin(t)*amp))
	set_rot(sin(t*rotOffset)*rotAmp)