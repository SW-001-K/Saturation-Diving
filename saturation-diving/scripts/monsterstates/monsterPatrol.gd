extends monsterstate
class_name patrolState

#Me when I hardcode my paths



func Enter():
	print("I am patrol")
	pass
	

func Patrol(path):
	monster.position = path.global_position
	monster.global_rotation = path.global_rotation
	#print(monster.global_position)
	

func Physics_Update(_delta: float):
	Patrol(Global.currentPath)
	
	#print("I am ", currentPath.name, " from state machine")
	
