extends Area2D

func _input_event(viewport, event, shape_idx):
	get_parent().clicked(event)