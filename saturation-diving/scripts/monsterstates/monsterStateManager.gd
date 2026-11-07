extends stateMachine
@export var monster: CharacterBody3D 
var monsterPos
var diverPosition
signal signalName #this is to communicate between functions. Ok! 


func getNodeNames(nodeName: String) -> state:
	for child in get_children():
		if states[child.name.to_lower()] == states[nodeName]:
			return child
	return 

func _init():
	Global.alert.connect(Location_Capture)
	signalName.connect(receiveSignal)

#for whatever reason, might be bloat though

func Location_Capture(diverPos): 
	diverPosition = diverPos
	print("Player Position is at ", diverPos)
	print("Monster Position is at ", monster.global_position)
	Path_Manager()
	
func Path_Manager():
	print("I am diver position from path manager", diverPosition)
	signalName.emit("alert")

	
	
func receiveSignal(signalName):
	if currentState == getNodeNames("patrol"):
		if signalName == "alert":
			getNodeNames("patrol").Change_State("transition")
			
	elif currentState == getNodeNames("transition"):
		if signalName == "alert":
			getNodeNames("transition").Change_State("patrol")
			
		pass
	
	#print("Player Position is at ", diverPosition)
	#print("Monster Position is at ", monster.global_position)
	
	
																			
	pass
	
