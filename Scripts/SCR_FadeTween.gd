extends Node

func _ready():
	var fade_tween = create_tween().set_loops()
	fade_tween.tween_property(self,"modulate", Color.TRANSPARENT, 1.5)
	fade_tween.tween_property(self,"modulate", Color.WHITE, 1.5)
