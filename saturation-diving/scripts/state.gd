# state.gd
#I am playing puzzles
extends Node3D

class_name state
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
	pass
	
func Physics_Update(_delta: float):
	pass
		
# Writing _delta instead of delta here prevents the unused variable warning.
func Change_State(Target):
	transitioned.emit(self,Target)
	pass
