extends Node

@export var intro_dialogue : DialogueResource

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(intro_dialogue, "start")
	
