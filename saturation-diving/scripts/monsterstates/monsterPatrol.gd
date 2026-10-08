extends monsterstate
class_name patrolState

var pathOne: Node3D
var pathTwo: Node3D

func Enter():
	pathOne = get_node("../../../Patrol 1/PathFollow3D/Patrol1")

func Physics_Update(_delta: float):
	monster.position = pathOne.global_position
	print("I am path one")
	
