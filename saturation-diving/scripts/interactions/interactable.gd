extends CollisionObject3D
class_name Interactable


@export var prompt_message : String
@export var objectName : String 

func interact(body):
	print("I sent the signal")
	Global.interacted.emit(objectName)
	
	
#send signal back to thought manager
#sends back the correct message
