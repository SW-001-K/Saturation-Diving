extends state
class_name playerMapper

@export var stateMachine : stateMachine
@export var hover : state
@export var swim : state
@export var diver: CharacterBody3D


func Physics_Update(_delta: float):
	

	if stateMachine.currentState == swim:
			swim.Change_State("hover")

		
	if stateMachine.currentState == hover:
			hover.Change_State("swim")
