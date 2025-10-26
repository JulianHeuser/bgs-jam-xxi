extends Control

var music = AudioServer.get_bus_index("Music")
var sfx = AudioServer.get_bus_index("SFX")



func _on_music_volume_changed(value) -> void:
	AudioServer.set_bus_volume_db(music,value)
	
	if value == -30:
		AudioServer.set_bus_mute(music,true)
	else:
		AudioServer.set_bus_mute(music,false)


func _on_sf_volume_changed(value) -> void:
	AudioServer.set_bus_volume_db(sfx,value)
	
	if value == -30:
		AudioServer.set_bus_mute(sfx,true)
	else:
		AudioServer.set_bus_mute(sfx,false)
