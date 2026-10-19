extends Control
var hovering: bool = false
var dragging: bool = true
var event : InputEventMouseButton
@export var content: LogData

@onready var label = $Panel/Label
@onready var panel = $Panel

func _ready() -> void:
	self.hide()
	label.text = content.title
	panel.mouse_entered.connect(hover)
	Global.interacted.connect(discovered)
	
func discovered(objectName) -> void:
	#print("I got signal from thoughts")
	#print(objectName)
	#print(content.title)
	if objectName == content.ID:
		content.discovered = true
		self.show()
		
	
func _process(delta: float) -> void:
	if hovering == true:
		if Input.is_action_just_pressed("mouse_left"):
			Global.requestLogInfo.emit(content)
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
			
	
	
