extends Sprite2D

@export var dialogue : DialogueResource

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if is_pixel_opaque(get_local_mouse_position()):
				print("clicked")
				DialogueManager.show_dialogue_balloon(dialogue,"start")
