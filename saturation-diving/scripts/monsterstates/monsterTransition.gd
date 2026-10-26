extends monsterstate
class_name transitionState
 
#handles transition between pathways.
#from path A to path B
#current path to next path

func Transition():
	if nextPath != null:
		var path = flightNavigation.find_path(position, nextPath)
		pass
	
func Update(_delta:float):

	pass
	
