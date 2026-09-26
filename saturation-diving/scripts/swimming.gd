extends swimState
class_name swimmingState

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func Enter():
	diver.motion_mode = CharacterBody3D.MOTION_MODE_FLOATING
	print("I am swimming while moving")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func Physics_Update(delta: float):
	

	# Add the gravity.
	if not diver.is_on_floor():
		diver.velocity += diver.get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and diver.is_on_floor():
		diver.velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	direction = direction.rotated(Vector3.UP, %Camera3D.global_rotation.y)
	if direction:
		diver.velocity.x = direction.x * SPEED
		diver.velocity.z = direction.z * SPEED
	else:
		diver.velocity.x = 0.0
		diver.velocity.z = 0.0

	diver.move_and_slide()
	
	#if Input.is_action_just_pressed("change state"):
		#Change_State("swim")
		#pass
	#
	pass
	
