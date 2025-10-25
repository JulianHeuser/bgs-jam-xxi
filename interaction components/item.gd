extends StaticBody2D

@onready var interactable : Area2D = $interactable
@onready var sprite2d : Sprite2D = $Sprite2D
@export var id = 0

func _ready():
	interactable.interact = _on_interact
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _on_interact():
	get_tree().change_scene_to_file("res://dialogue/dialogue.dialogue")
