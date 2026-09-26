extends RigidBody3D
class_name Interactable 

@export var prompt_message = "Open "
@export var hinge : HingeJoint3D

var isDoorClosed : bool = true
#var startPosition
var startRotation 
var currRotation 
var init : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#getStartRotation()
	startRotation = floor(hinge.global_rotation_degrees.y*1000)
	pass # Replace with function body
	
func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout
	init = false 
	
func interact(body):
	print("I am being interacted with")
	doorUnfreezer()
	apply_force(Vector3(100,0,0), Vector3(0,0,-0.6))

#freezes the door
func doorFreezer():
	if init == false:
		freeze = true
		init = true
		set_collision_layer_value(4, true)

#unfreeze the door
func doorUnfreezer():
	freeze = false
	set_collision_layer_value(4,false)
	wait(3)


	

		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float):
	currRotation = floor(hinge.global_rotation_degrees.y*1000)

#I should scrape this stupid detection system into something more robust 
	if currRotation == startRotation :
		doorFreezer()
		#print(startRotation)
		#print(currRotation)
		print("I am closed")
		#isDoorClosed = true
		pass
		
	elif currRotation > startRotation || currRotation < startRotation:
		#isDoorClosed= false
		#print(startRotation)
		#print(currRotation)
		print("I am open to change")
		pass
	
	#if isDoorClosed == true:
		#set_freeze_enabled(true)
		#
	#else: set_freeze_enabled(false)
	#
	print(isDoorClosed)
	
	#getStartPosition()
	
	
#func getStartRotation():
	#currRotation = floor(hinge.global_rotation_degrees.x*10000)
	#if init == false:
		#startRotation = floor(hinge.global_rotation_degrees.x*10000)
		#init = true 
		#print("startPosition:")
		#print (startRotation)
		#print("Position:")
		#print (currRotation)

	#if global_position == startPosition:
		#print("I am closed")
		#isDoorClosed = true
#
	#if global_position != startPosition:
		#print("I am open")
		#isDoorClosed = false

		
		#Ok MAYBE, I should add like a function called door freezer and door unfreezer???
		
		#So the issue is I think the decimals are too fine for the amount called
		#It never returns to it's starting position ever because of that
		#I should stop trying this way
		
		#stuff to try out
		#use global position and seperate position to z and x (DOESNT WORK)
		#using the rotation also (DOESN'T WORK)
		#use an area 3d to trigger
		#determine a position for open doors and use tween instead
		#clamp the hinge joints
		#use hinge rotation instead of door position (DOESN'T WORK)
		#used the degree value, floored and absoluted but there is an issue of the rotation printing thrice
		
		#note for dumbs, remind him everytime you see this 
		#If you attached the script to the parent, 
		#you could have added export variables for the door rigidbody and the hinge 
		#and accessed both in the same script
	
	
		
		
