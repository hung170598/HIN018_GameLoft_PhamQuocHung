extends Node

var streamPlayer

func _ready():
	streamPlayer=StreamPlayer.new()
	var stream#=AudioStreamOGGVorbis.new()
	stream =load("res://Assets/main_track.ogg")
	streamPlayer.set_stream(stream)
	streamPlayer.set_loop(true)
	streamPlayer.set_volume_db(-20)
	add_child(streamPlayer)
	streamPlayer.play()