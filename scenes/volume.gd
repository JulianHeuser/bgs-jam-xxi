extends Control

var music = AudioServer.get_bus_index("Music")
var sfx = AudioServer.get_bus_index("SFX")

func _ready() -> void:
	$"ColorRect/VBoxContainer/Music Volume".value = AudioServer.get_bus_volume_linear(music)
	$"ColorRect/VBoxContainer/SF Volume".value = AudioServer.get_bus_volume_linear(sfx)


func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/options.tscn")
	

func _on_music_volume_changed(value) -> void:
	AudioServer.set_bus_volume_linear(music,$"ColorRect/VBoxContainer/Music Volume".value)
	
	if $"ColorRect/VBoxContainer/Music Volume".value == 0:
		AudioServer.set_bus_mute(music,true)
	else:
		AudioServer.set_bus_mute(music,false)


func _on_sf_volume_changed(value) -> void:
	AudioServer.set_bus_volume_linear(sfx,$"ColorRect/VBoxContainer/SF Volume".value)
	
	if $"ColorRect/VBoxContainer/SF Volume".value == 0:
		AudioServer.set_bus_mute(sfx,true)
	else:
		AudioServer.set_bus_mute(sfx,false)
