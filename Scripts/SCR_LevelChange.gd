extends Node2D

var get_current_level = Datamanager.current_level

func _input(event):
	if event is InputEventKey:
		if event.keycode == KEY_9 && event.is_pressed() == true:
			match get_current_level:
				0:
					print("Level 0")
					Datamanager.current_level += 1
					
				1:
					print("Level 1")
					Datamanager.current_level += 1
	# Reload Scene
	if event is InputEventKey:
		if event.keycode == KEY_R:
			get_tree().reload_current_scene()
			print("Scene Reloaded")
