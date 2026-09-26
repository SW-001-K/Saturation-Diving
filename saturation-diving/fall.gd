extends jumpState
# Called when the node enters the scene tree for the first time.
func Enter():
	print("I fall")
	
func Physics_Update(delta: float):
	if not diver.is_on_floor():
		diver.velocity += diver.get_gravity() * delta
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

	
