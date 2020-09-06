extends Node2D

export var loadScene="main_menu"

var target#if ball enters area, pull towards center and end level
var fac=.2#pull factor
var facAway=1#pull factor when moving away

var samplePlayer

func _ready():
	samplePlayer=get_node("SamplePlayer2D")
	
	set_process(true)
	
func _process(delta):
	if target==null:
		return
	
	#converge to point
	var dif=get_pos()-target.get_pos()
	var difN=dif
	difN/=difN.length()
	var lvN=target.get_linear_velocity()
	lvN/=lvN.length()
	var angle=acos(difN.dot(lvN))
	if angle>=5*PI/6:
		dif*=facAway
	#	print(1)
	else:
		dif*=fac
	#	print(2)
	target.apply_impulse(Vector2(),dif)
	
	#if velocity isnt too high and world is close to center, go to next scene
	var speed=target.get_linear_velocity().length()
	var dist=(get_pos()-target.get_pos()).length()
	if speed<=10 and dist<=10:
		if loadScene.casecmp_to("")==0:
			loadScene="main_menu"
		
		get_tree().change_scene(str("res://Scenes/", loadScene, ".scn"))
	
func body_entered(body):
	target=body
	
	if target.inGoal:
		return#already in goal, dont play sound again
	
	samplePlayer.play("goal")
	
	target.inGoal=true
	target.set_linear_damp(1.5)
	target.set_gravity_scale(0)