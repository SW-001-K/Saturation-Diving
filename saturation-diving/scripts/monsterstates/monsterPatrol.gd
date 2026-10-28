extends monsterstate
class_name patrolState

#Me when I hardcode my paths

var pathA: Node3D
var pathB: Node3D
var pathC: Node3D

func Enter():
	pathA = get_node("../../../Patrol A/PathA/PathA")
	currentPath = pathA
	
	
func Patrol(path):
	monster.position = path.global_position
	print(monster.global_position)
	

func Physics_Update(_delta: float):
	Patrol(currentPath)
	print("I am ", currentPath.name, " from state machine")
	
