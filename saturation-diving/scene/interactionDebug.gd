extends Control

var properties: Array

@onready var container = $Panel/VBoxContainer
var information


func _ready() -> void:
	Global.interacted.connect(interactionManager)
	
#for information
func interactionManager(objectName):
	print("I got the signal")
	if objectName == "box 1":
		information = "I am cool as hell"
		newInteraction(objectName,information)
	
	elif objectName == "box 2":
		information = "This is my outro"
		newInteraction(objectName,information)
		

func newInteraction(id: StringName, objInformation):
	var property = Label.new()
	container.add_child(property)
	property.name = id
	property.text = id + ": " + objInformation
