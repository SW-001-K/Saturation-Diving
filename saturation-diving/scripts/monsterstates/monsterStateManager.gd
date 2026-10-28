extends stateMachine
@export var monster: CharacterBody3D 
var monsterPos

func _ready():
	Global.alert.connect(Path_Manager)

#for whatever reason, might be bloat though

func Path_Manager(diverPos): 
	print("Player Position is at ", diverPos)
	print("Monster Position is at ", monster.global_position)

	
	pass
	
	
