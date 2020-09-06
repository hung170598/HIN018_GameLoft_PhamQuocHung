extends Node2D

var gravity#=98
var player
var points=[]

#how much of the trajectory should be shown and in how many steps
var showRange=.9
var resolution=20.0

var mouseDifference

func _ready():
	gravity=Globals.get("physics_2d/default_gravity")
	#print(gravity)
	player=get_parent().find_node("Player")
	
	set_process(true)
	
func _process(delta):
	var mouseDown=player.get("mouseDown")
	
	points=[]
	
	if mouseDown==null:
		return
	if player.shot:
		update()
		return
	
	var currPos=player.viewToWorld(get_viewport().get_mouse_pos())
	mouseDifference=mouseDown-currPos
	var angle=atan(mouseDifference.y/mouseDifference.x)
#	print(str(mouseDifference,angle))

	points.append(mouseDown-mouseDifference)
	points.append(mouseDown)
	
	for i in range(1.0, resolution):
		var t=showRange*(i/resolution)
		#x is mousedown + velocity*t
		points.append(Vector2(mouseDown.x+mouseDifference.x*player.speedMultiplier*t,
		 mouseDown.y+getHeight(t, angle)))
		
	update()

func getHeight(t, ang):
	var h=t*mouseDifference.y*player.speedMultiplier+gravity/2*pow(t,2);
	return h

func _draw():
	if points.size()==0:
		return
	
	for i in range(0, points.size()-1):
		draw_line(points[i], points[i+1], Color(0,0,0, 1-float(i)/points.size()), 3)
		
	draw_circle(points[0], 3, Color(0,0,0));