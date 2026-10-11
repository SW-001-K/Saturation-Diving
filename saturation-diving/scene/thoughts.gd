extends Control
var hovering: bool = false
var dragging: bool = true
var event : InputEventMouseButton
@export var thoughtID :int


@onready var label = $Panel/Label
@onready var panel = $Panel
@export var labeltext : String

func _ready() -> void:
	label.text = labeltext
	panel.mouse_entered.connect(hover)
	
func _process(delta: float) -> void:
	if hovering == true:
		if Input.is_action_just_pressed("mouse_left"):
			Global.requestLogInfo.emit(thoughtID)
		elif Input.is_action_pressed("mouse_left"):
			"I am being clicked on"
			panel.global_position = get_global_mouse_position() - Vector2(panel.size.x*0.5, panel.size.y*0.5) 
			dragging = true
			
		elif Input.is_action_just_released("mouse_left"):
			dragging = false
			hovering = false
		

func hover():
	print("I am hovering")
	hovering = true
	
	
func _on_mouse_entered() -> void:

	pass # Replace with function body.


func _on_mouse_exited() -> void:
	pass # Replace with function body.
	
#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#if event.is_action_pressed("double_click") and event.double_click:
			#accept_event()
			#print("I am being double clicked")
			#Global.requestLogInfo.emit(thoughtID)
			#
			
	
	
