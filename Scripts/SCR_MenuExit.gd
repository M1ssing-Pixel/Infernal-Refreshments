extends Area2D

var summon_circle: Sprite2D
var is_colliding: bool

func _ready():
	summon_circle = get_child(0).get_child(0)
	summon_circle.visible = false
	is_colliding = false

func _mouse_enter():
	summon_circle.visible = true
	is_colliding = true

func _mouse_exit():
	summon_circle.visible = false
	is_colliding = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.is_pressed() == true:
			if is_colliding == true:
				get_tree().quit()
