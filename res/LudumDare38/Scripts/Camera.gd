extends Camera2D

var fac=.1

var anchors
var ball
var target=Vector2()

var stopped=false#if ball falls out of bounds this is set to true

func _ready():
	anchors=get_tree().get_nodes_in_group("camera_anchors")
	ball=get_parent().get_parent().find_node("Ball")
	
	#set position here so camera doesnt move when player enters
	if anchors.size()==0:
		target=ball.get_pos()
		update_pos()
		return
	
	#check distance to anchors
	var closestAnchor
	var smallest=1000000#arbitrary large starting value
	for a in anchors:
		var dist=(ball.get_pos()-a.get_pos()).length()
		if dist<smallest:
			smallest=dist
			closestAnchor=a
	
	
	if closestAnchor!=null and abs((ball.get_pos()-closestAnchor.get_pos()).y)>Globals.get("display/height")*.45 or abs((ball.get_pos()-closestAnchor.get_pos()).x)>Globals.get("display/width")*.45:
		target=ball.get_pos()
	else:
		target=closestAnchor.get_pos()
	
	set_pos(target)
	
	set_fixed_process(true)
	
func _fixed_process(delta):
	if stopped:
		update_pos()
		return
	
	if anchors.size()==0:
		target=ball.get_pos()
		update_pos()
		return
	
	#check distance to anchors
	var closestAnchor
	var smallest=1000000#arbitrary large starting value
	for a in anchors:
		var dist=(ball.get_pos()-a.get_pos()).length()
		if dist<smallest:
			smallest=dist
			closestAnchor=a
	
	
	if closestAnchor!=null and abs((ball.get_pos()-closestAnchor.get_pos()).y)>Globals.get("display/height")*.45 or abs((ball.get_pos()-closestAnchor.get_pos()).x)>Globals.get("display/width")*.45:
		target=ball.get_pos()
	else:
		target=closestAnchor.get_pos()
	
	update_pos()
	
func update_pos():
	if (target-get_pos()).length()<5:
		set_pos(target)
	else:
		translate((target-get_pos())*fac)
