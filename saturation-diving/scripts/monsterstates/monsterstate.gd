extends state
class_name monsterstate

@export var monster: CharacterBody3D


var monsterSpeed
var currentPath
var nextPath = null
var flightNavigation


	
func Enter():
	flightNavigation = get_node("FlightNavigation3D")
	
func Find_Next_Path():
	pass
	
func Update(_delta:float):
	#if Input.is_action_just_pressed("alert"):
			#Press.emit("alert")
			#pass
			#
	#else: Press.emit("null")
	pass
