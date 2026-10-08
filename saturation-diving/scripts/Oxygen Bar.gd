extends ProgressBar
@export var diver : CharacterBody3D
var oxygen = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_value = oxygen
	value = oxygen
	min_value = 0
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	value -= 1
	
	if oxygen == 0:
		print("goodbye")
	pass
