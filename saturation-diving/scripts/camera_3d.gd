extends Camera3D

@export_range(0.1, 1.5, 0.1) var sensitivity := 0.3
const bobFreq = 2.0
const bobAmp = 0.08

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(_delta: float) -> void:
	pass
	

# ---------- Camera rotation ----------
func _unhandled_input(event: InputEvent):
	
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		
		#rotating left and right
		rotation_degrees.y -= event.screen_relative.x * sensitivity
		rotation_degrees.y = wrapf(rotation_degrees.y, 0, 360)
		
		#rotating up and down
		rotation_degrees.x -= event.screen_relative.y * sensitivity
		rotation_degrees.x = clampf(rotation_degrees.x, -90, 90)
		
	

func _input(_event: InputEvent) -> void:
	if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED and Input.is_action_just_pressed("click_l"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if Input.is_action_pressed("escape"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
