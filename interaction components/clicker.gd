class_name Clicker extends Sprite2D

@export var dialogue : DialogueResource
@export var item_name : String
var interactable = true

static var selected_items : Array[String]

func _ready() -> void:
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
				DialogueManager.show_dialogue_balloon(dialogue,"start", [self])

func add_item_to_clues() -> void:
	print("ADDED THE THING!")
