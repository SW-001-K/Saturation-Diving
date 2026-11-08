extends state
class_name monsterstate

@export var monster: CharacterBody3D


var monsterSpeed = 1
var flightNavigation

var pathA: Node3D
var pathB: Node3D
var pathC: Node3D

#so path management should happen here
func _ready() -> void:
	pathA = get_node("../../../Patrol A/PathA/PathA")
	pathB = get_node("../../../Patrol B/PathB/PathB")
	pathC = get_node("../../../Patrol C/PathC/PathC")
	Global.currentPath = pathA
	flightNavigation = get_node("../../../FlightNavigation3D")
	Global.alert.connect(Find_Next_Path) #this is the sound

#function to find next path
func Find_Next_Path(diverPos):
	print(diverPos.distance_to(monster.global_position))
	if Global.currentPath == pathA:
		Global.nextPath = pathB
		
	elif Global.currentPath == pathB:
		Global.nextPath = pathC
		
	elif Global.currentPath == pathC:
		Global.nextPath = pathA
		
	print("next path is: ", Global.nextPath)
	print("curr path is: ", Global.currentPath)
		
	pass
	
#what is even the point of this
func Update(_delta:float):
	#if Input.is_action_just_pressed("alert"):
			#Press.emit("alert")
			#pass
			#
	#else: Press.emit("null")
	pass
