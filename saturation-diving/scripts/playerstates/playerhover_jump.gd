extends hoverState
class_name jumpState


func Enter():
	print("I jump")
	
func Physics_Update(delta: float):
	if not diver.is_on_floor():
		diver.velocity += diver.get_gravity() * delta
		
	if diver.is_on_floor():
		diver.velocity.y = JUMP_VELOCITY
		
	diver.move_and_slide()
	
