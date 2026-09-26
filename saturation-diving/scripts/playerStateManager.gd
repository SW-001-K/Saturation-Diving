extends stateMachine
@export var diver: CharacterBody3D

func getNodeNames(nodeName: String) -> state:
	for child in get_children():
		if states[child.name.to_lower()] == states[nodeName]:
			return child
	return 
	
#states[child.name.to_lower()] = child
#child.transitioned.connect(on_child_transition)

func receiveSignal(signalName):
	#print("I receive the signal: ", signalName)
	#for swim states
	if currentState == getNodeNames("swim"):
		if signalName == "change state":
			getNodeNames("swim").Change_State("hover")
			
		elif signalName == "move":
			getNodeNames("swim").Change_State("swimming")
			pass 
			
	#for hover states 	
	elif currentState == getNodeNames("hover"):
		if signalName == "change state":
			getNodeNames("hover").Change_State("swim")
		
		elif signalName == "jump" && diver.is_on_floor():
			getNodeNames("hover").Change_State("jump")
			
		elif signalName == "move":
			getNodeNames("hover").Change_State("moving")
		
	#
	elif currentState == getNodeNames("jump") && not diver.is_on_floor():
		getNodeNames("jump").Change_State("fall")
	
	elif currentState == getNodeNames("fall") && diver.is_on_floor():
		getNodeNames("fall").Change_State("hover")
		
	elif signalName == "null" && currentState == getNodeNames("moving"):
		getNodeNames("moving").Change_State("hover")
			
	elif signalName == "null" && currentState == getNodeNames("swimming"):
		getNodeNames("swimming").Change_State("swim")
		
	elif currentState == getNodeNames("moving"):
		if signalName == "jump":
			currentState.Change_State("jump")
		
	
			
	
			
	
			
