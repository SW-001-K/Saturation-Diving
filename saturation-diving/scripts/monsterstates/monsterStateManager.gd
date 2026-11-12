extends stateMachine
@export var monster: CharacterBody3D 

var monsterPos
signal signalName #this is to communicate between functions. Ok! 
var distance
var alertRange = Vector3(70,70,70)


func getNodeNames(nodeName: String) -> state:
	for child in get_children():
		if states[child.name.to_lower()] == states[nodeName]:
			return child
	return 

func _init():
	Global.alert.connect(Location_Capture)
	signalName.connect(receiveSignal)
	Global.doneTransitioning.connect(receiveSignal)

#for whatever reason, might be bloat though

func Location_Capture(diverPos): 

	Global.diverPosition = diverPos
	#print("Player Position is at ", diverPos)
	#print("Monster Position is at ", monster.global_position)
	distance = abs(diverPos-monster.global_position)
	
	#testing distance
	if distance < alertRange :
		print("I am close!")
		
	else: print ("I am far")
	
	print("Player to monster distance: ", distance)
	Path_Manager()
	
func Path_Manager():
	print("I am diver position from path manager", Global.diverPosition)
	signalName.emit("alert")
	
	
func receiveSignal(signalName):
	if currentState == getNodeNames("patrol"):
		if signalName == "alert":
			getNodeNames("patrol").Change_State("transition")
			
		#if signalName == "alert" && distance > alertRange:
			#getNodeNames("patrol").Change_State("transition")
		#
		#elif signalName == "alert" && distance < alertRange:
			#getNodeNames("patrol").Change_State("pursue")
			
			
	elif currentState == getNodeNames("transition"):
		if signalName == "transitioned":
			getNodeNames("transition").Change_State("patrol")
			
		pass
	
	#print("Player Position is at ", diverPosition)
	#print("Monster Position is at ", monster.global_position)
	
	
																			
	pass
	
