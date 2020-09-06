extends Sprite

var t=0
var period=8
var startPos
var amp=5

func _ready():
	startPos=get_pos().y
	set_process(true)
	
func _process(delta):
	t+=delta*(2*PI)/period
	set_pos(Vector2(get_pos().x, startPos+sin(t)*amp))