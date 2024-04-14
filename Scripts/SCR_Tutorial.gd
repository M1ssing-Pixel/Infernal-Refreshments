extends Node

var tutorial_step: int = 0
var phase_one: Control
var phase_two: Control
var phase_three: Control
var phase_four: Control
var phase_five: Control
var phase_six: Control
var accept_sfx: AudioStreamPlayer

func _ready():
	# Fix This Later
	phase_one = get_child(0)
	phase_one.visible = true
	phase_two = get_child(1)
	phase_two.visible = false
	phase_three = get_child(2)
	phase_three.visible = false
	phase_four = get_child(3)
	phase_four.visible = false
	phase_five = get_child(4)
	phase_five.visible = false
	phase_six = get_child(5)
	phase_six.visible = false
	
	# SFX
	accept_sfx = get_child(6)

func _input(event):
	if event is InputEventKey:
		if event.keycode == KEY_ENTER && event.is_pressed():
			tutorial_step += 1
			accept_sfx.play()

#Tutorial sequence
func  _process(delta):
	match tutorial_step:
		0:
			pass
		1:
			phase_one.get_child(1).text = str("\n[center][outline_size={2}]Ah, but first I neeed to teach you how to help me.")
		2:
			phase_one.visible = false
			phase_two.visible = true
		3:
			phase_two.get_child(0).text = str("\n[center][outline_size={2}]They represent the amount of demonic energy you've collected of each type.")
		4:
			phase_two.visible = false
			phase_three.visible = true
		5:
			phase_three.visible = false
			phase_four.visible = true
		6:
			phase_four.visible = false
			phase_five.visible = true
		7:
			phase_five.visible = false
			phase_six.visible = true
		8:
			phase_six.visible = false
			phase_one.visible = true
			phase_one.get_child(1).text = str("\n[center][outline_size={2}]Remember, be warry of the order you buy. But if you need too, press the\"R\" button to retry. ")
		9:
			phase_one.get_child(1).text = str("\n[center][outline_size={2}]Now then, hurry up and get me outta here!")
		10:
			get_tree().change_scene_to_file("res://Save Scenes/TSC_TutorialSceneCont.tscn")
