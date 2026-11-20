extends Node3D

@onready var saxBGM = $saxBGM

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	saxBGM.play()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
