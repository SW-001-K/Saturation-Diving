# state.gd
#I am playing puzzles
extends Node3D

class_name state
var input 
signal transitioned
signal Press

var change_state
var animated_sprite
var persistent_state

func Enter():
	pass
	
func Exit():
	pass
	
func Update(_delta:float):
		if Input.is_action_just_pressed("change state"):
			Press.emit("change state")
			pass
			
		if Input.is_action_just_pressed("jump"):
			Press.emit("jump")
			pass
		
		if Input.get_vector("left", "right", "forward", "back",):
			Press.emit("move")
			
		else: Press.emit("null")
	
func Physics_Update(_delta: float):
	pass
	
# Writing _delta instead of delta here prevents the unused variable warning.
func Change_State(Target):
	transitioned.emit(self,Target)
	
	pass

func buttonPress(button):
	if Input.is_action_just_pressed("change state"):
		Press.emit(button)
		
	pass
