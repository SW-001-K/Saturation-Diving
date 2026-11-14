extends Control
#KILL THIS ONE

@export var buttonText : String
@onready var label = $Label
@onready var colShape = $Area2D

var hovering: bool = false
var dragging: bool = true
var event : InputEventMouseButton


func _ready() -> void:
	label.text = buttonText
	colShape.mouse_entered.connect(hover)
	colShape.mouse_exited.connect(unhovered)
	pass

	
func _process(delta: float) -> void:
	if hovering == true:
		if Input.is_action_just_pressed("mouse_left"):
			print("I am being clicked")
			pass
			
		

func hover():
	print("I am hovering")
	hovering = true
	
func unhovered():
	print("I am being unhovered")
	hovering = false
	

func _on_area_2d_mouse_entered() -> void:
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	pass # Replace with function body.
