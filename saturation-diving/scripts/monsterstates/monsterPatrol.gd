extends monsterstate
class_name patrolState

#Me when I hardcode my paths



func Enter():
	print("I am patrol")
	pass
	

func Patrol(path):
	monster.position = path.global_position
	#print(monster.global_position)
	

func Physics_Update(_delta: float):
	Patrol(currentPath)
	
	#print("I am ", currentPath.name, " from state machine")
	
