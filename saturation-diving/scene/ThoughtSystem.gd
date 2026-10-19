extends Control
var hiddenMenu: bool = true

func _ready() -> void:
	self.hide()
	pass
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("open_menu"):
		if hiddenMenu == true:
			hiddenMenu = false
			self.show()
			Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	
		else:
			self.hide()
			hiddenMenu = true
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			
		
