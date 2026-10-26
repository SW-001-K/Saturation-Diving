extends state
class_name playerstate
@export var diver: CharacterBody3D
#What is this for?
#Some stuff that are better to be seperated, like player input sending signals. Wouldn't wanna that in monster! 

func Update(_delta:float):
	if Input.is_action_just_pressed("change state"):
			Press.emit("change state")
			pass
			
	if Input.is_action_just_pressed("jump"):
			Press.emit("jump")
			pass
		
	if Input.is_action_just_pressed("alert"):
			Alert()

	if Input.get_vector("left", "right", "forward", "back",):
			Press.emit("move")
			
	else: Press.emit("null")
	
func Alert():
	Global.alert.emit(diver.global_position)
	pass
	
