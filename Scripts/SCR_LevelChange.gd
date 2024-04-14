extends Node2D

var get_current_level = Datamanager.current_level
var ready_to_change_level: bool

func _ready():
	ready_to_change_level = false

func _input(event):
	# Reload Scene
	if event is InputEventKey:
		if event.keycode == KEY_R:
			get_tree().reload_current_scene()
			print("Scene Reloaded")
		
		if event.keycode == KEY_ENTER:
			if ready_to_change_level == true:
				match get_current_level:
					0:
						print("Level 0")
						Datamanager.current_level += 1
						get_tree().change_scene_to_file("res://Save Scenes/TSC_Thanks.tscn")
					1:
						print("Level 1")
						Datamanager.current_level += 1

func _on_game_manager_change_level():
	ready_to_change_level = true
