extends Node
var Day

#This is the Day Manager, It manages Days 

func _ready() -> void:
	Global.dayEnded = true
	Global.dayEnd.connect(Manager)

func Manager(action):
	print("The action performed is ", action)
	if action == "sleep":
		if Global.dayEnded == true:
			New_Day()
			
		else: print("I can't sleep yet")
		
	if action =="exit":
		if Global.dayEnded == true: 
			print("Let me sleep first")
		
		if Global.dayEnded == false:
			get_tree().change_scene_to_file("res://scene/main.tscn")
			
	if action == "enter":
		End_Day()
		
func New_Day():
	print("It's a new day")
	Global.dayCount += 1 
	Global.dayEnded = false
		

	#Global.dayEnded = false
	#Day++
	#Can go out
	#Cannot sleep 
	#New Log 
	
func End_Day():
	get_tree().change_scene_to_file("res://scene/Habitat.tscn")
	print("I have ended the day")
	Global.dayEnded = true
	
	#Global.dayEnded = true
	#
	#Cannot go out
	#Can Sleep
	#No New Log 

	
func Sleep():
	#Interact with bed for a new day
	pass
	
func Days():
	#Handles Day Interactions and the logs that come
	pass
