extends Node
func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/bedroom.tscn")
	

func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/options.tscn")
	
func _on_quit_pressed():
	get_tree().quit()


func _on_direction_pressed():
	get_tree().change_scene_to_file("res://scenes/direction.tscn")


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("leave"):
		get_tree().quit()


func _on_volume_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/volume.tscn")
