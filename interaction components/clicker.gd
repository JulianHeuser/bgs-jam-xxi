class_name Clicker extends Sprite2D

@onready var UI : UIManager = $"../%UI"

@export var dialogue : DialogueResource
@export var item_name : String
var interactable = true

@onready var ask_dialogue : DialogueResource = preload("res://dialogue/ask_dialogue.dialogue")
@onready var already_selected: DialogueResource = preload("res://dialogue/already_selected.dialogue")

static var selected_items : Array[String]
static var num_of_items : int = 0

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
					
				

func add_item_to_clues() -> void:
	if item_name in selected_items:
		# Item already selected
		return
	selected_items[num_of_items] = item_name
	UI.set_texture(num_of_items, texture)
	
	num_of_items += 1
	
	if num_of_items == 3:
		print("Wow you did it awesome")
		if "SurfBoard" in selected_items and \
			"Trophy" in selected_items and \
			"Red Crystal" in selected_items:
				get_tree().change_scene_to_file("res://scenes/win.tscn")
		else: get_tree().change_scene_to_file("res://scenes/lose.tscn")
		
		selected_items = ["", "", ""]
		num_of_items = 0
