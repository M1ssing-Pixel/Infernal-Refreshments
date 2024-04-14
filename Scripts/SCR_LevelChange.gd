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
						print("Level 1")
						Datamanager.current_level += 1
						get_tree().change_scene_to_file("res://Save Scenes/TSC_Level1.tscn")
					1:
						print("Level 2")
						Datamanager.current_level += 1
						get_tree().change_scene_to_file("res://Save Scenes/TSC_Level2.tscn")
					2:
						print("Level 3")
						Datamanager.current_level += 1
						get_tree().change_scene_to_file("res://Save Scenes/TSC_Level3.tscn")
					3:
						print("Level 4")
						Datamanager.current_level += 1
						get_tree().change_scene_to_file("res://Save Scenes/TSC_Level4.tscn")
					4:
						print("Level 5")
						Datamanager.current_level += 1
						get_tree().change_scene_to_file("res://Save Scenes/TSC_Level5.tscn")
					5:
						print("Thanks!")
						get_tree().change_scene_to_file("res://Save Scenes/TSC_Thanks.tscn")

func _on_game_manager_change_level():
	ready_to_change_level = true
