extends AudioStreamPlayer

func _ready() -> void:
	var tween : Tween = create_tween()
	tween.tween_property(self, "volume_linear", 1.0, 2.0)
