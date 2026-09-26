extends CenterContainer

@export var raycast : RayCast3D
@onready var prompt = $prompt

var ret_colour : Color = Color.WHITE                                   
var dot_radius : float = 2.0
var ring_radius : float = 0.0


func _ready() -> void:
	queue_redraw()

func _process(delta: float) -> void:
	
	prompt.text = ""
	
	if raycast.get_collider() != null:
		var collider = raycast.get_collider()
		
		prompt.text = collider.prompt_message + collider.name
		ring_radius = lerp(ring_radius, 30.0, 25 * delta)
		queue_redraw()
		
		if Input.is_action_just_pressed("interact"):
			collider.interact(owner)
			
	else:
		ring_radius = lerp(ring_radius, 0.0, 25 * delta)
		queue_redraw()
	

func _draw():
	draw_circle(Vector2(0, 0), dot_radius, ret_colour)
	draw_circle(Vector2(0, 0), ring_radius, ret_colour, false)
