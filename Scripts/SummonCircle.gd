extends Sprite2D

func _ready():
	var fade_tween = create_tween().set_loops()
	fade_tween.tween_property(self,"rotation", 360, 150)
	fade_tween.tween_property(self,"rotation", 0, 150)
