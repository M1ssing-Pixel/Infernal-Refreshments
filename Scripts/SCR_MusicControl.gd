extends Node

var get_stream = load("res://Sounds/BGM_VendingSong.ogg")

func _play_music():
	$Music.stream = get_stream
	$Music.play()
	
