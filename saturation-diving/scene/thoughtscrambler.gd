extends Container

var thoughts : Dictionary = {}
func scramble():
	for i in get_children():
		i.position = Vector2(randf_range(0,500), randf_range(0, 70))
		pass
	pass
	
func _ready() -> void:
	scramble()
