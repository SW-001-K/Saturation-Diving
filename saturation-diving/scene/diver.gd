extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

enum States {hover, swim}

func _ready() -> void:
	pass
	#change_state("hover")
#
#func change_state(newState):
	#if state != null:
		#state.queue_free()
	#state = stateFactory.get_state(newState).new()
	#add_child(state)
	#
	
func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	velocity.x = 0
	velocity.z = 0

	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir := Input.get_vector("left", "right", "forward", "back")
	#var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
#
	#direction = direction.rotated(Vector3.UP, %Camera3D.global_rotation.y)
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = 0.0
		#velocity.z = 0.0
#
	#move_and_slide()
	pass
