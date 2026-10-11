extends Node
var Day

#This is the Day Manager, It manages Days 

func New_Day():
	Global.dayEnded = false
	#Day++
	
	#Can go out
	#Cannot sleep 
	#New Log 
	
func End_Day():
	Global.dayEnded = true
	
	#Cannot go out
	#Can Sleep
	#No New Log 
	
func Sleep():
	#Interact with bed for a new day
	pass
	
func Days():
	#Handles Day Interactions and the logs that come
	pass
