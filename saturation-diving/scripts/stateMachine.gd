extends Node
class_name stateMachine

@export var initialState : state
var states : Dictionary = {}
var currentState : state

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is state:
			states[child.name.to_lower()] = child
			child.transitioned.connect(on_child_transition)
			child.Press.connect(receiveSignal)

			
	if initialState: 
		initialState.Enter()
		currentState = initialState
	
	
		
#func get_state(stateName):
	#if states.has(stateName):
		#return states.get(stateName)
	#else:
		#printerr(stateName, ", no such thing")
		
func _process(delta):
	if currentState:
		currentState.Update(delta)

func _physics_process(delta):
	if currentState:
		currentState.Physics_Update(delta)
	
func on_child_transition(State, newStateName):
	if State != currentState:
		return
		
	var newState = states.get(newStateName.to_lower())
	if !newState:
		return
	
	if currentState:
		currentState.Exit()
	
	newState.Enter()
	currentState = newState
	
	pass

func receiveSignal(signalName):
	print("I received the signal ", signalName)
