class_name UIManager extends Control

@export var textures : Array[TextureRect]

func _ready() -> void:
	pass
	
func set_texture(i : int, texture : Texture2D) -> void:
	textures[i].texture = texture 
