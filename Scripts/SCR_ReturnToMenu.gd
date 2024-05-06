extends Control

func _input(event):
	if event is InputEventKey:
		if event.keycode == KEY_ENTER && event.is_pressed() == true:
			get_tree().change_scene_to_file("res://Scenes/TSC_MainMenu.tscn")
			Datamanager.current_level = 0
