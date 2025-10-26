class_name Clicker extends Sprite2D

@onready var UI : UIManager = $"../%UI"

@export var dialogue : DialogueResource
@export var item_name : String
var interactable = true

@onready var ask_dialogue : DialogueResource = preload("res://dialogue/ask_dialogue.dialogue")
@onready var already_selected: DialogueResource = preload("res://dialogue/already_selected.dialogue")

static var selected_items : Array[String]

func _ready() -> void:
	selected_items.resize(3)
	DialogueManager.dialogue_started.connect(
		func(_resource: DialogueResource): interactable = false
	)
	DialogueManager.dialogue_ended.connect(
		func(_resource: DialogueResource): interactable = true
	)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and interactable:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if is_pixel_opaque(get_local_mouse_position()):
				if $AudioStreamPlayer.stream != null:
					$AudioStreamPlayer.play()
				DialogueManager.show_dialogue_balloon(dialogue,"start", [self])
				await DialogueManager.dialogue_ended
				if item_name not in selected_items:
					DialogueManager.show_dialogue_balloon(ask_dialogue,"start", [self])
				else:
					DialogueManager.show_dialogue_balloon(already_selected,"start", [self])
					
				
# Type :
# 0 = means (Red Crystal)
# 1 = motive (Trophy)
# 2 = weapon (Surfboard)

func add_item_to_clues(type : int = 0) -> void:
	if item_name in selected_items:
		# Item already selected
		return
	selected_items[type] = item_name
	UI.set_texture(type, texture)
	
	if selected_items[0] != "" and selected_items[1] != "" and selected_items[2] != "":
		print("Wow you did it awesome")
		if "Red Crystal" == selected_items[0] and \
			"Trophy" == selected_items[1] and \
			"SurfBoard" == selected_items[2]:
				get_tree().change_scene_to_file("res://scenes/win.tscn")
		else: get_tree().change_scene_to_file("res://scenes/lose.tscn")
		
		selected_items = ["", "", ""]
