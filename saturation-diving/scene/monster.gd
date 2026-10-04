extends CharacterBody3D

@onready var pathOne = $"../Patrol 1/PathFollow3D/Patrol1"
@onready var pathTwo = $"../Patrol 2/PathFollow3D/Patrol2"
#@onready var navAgent: NavigationAgent3D = $NavigationAgent3D
var pathone :bool
var pathtwo :bool 

func _ready() -> void:
	position = pathOne.global_position
	print(pathOne.global_position)
	pathone = true
	pathtwo = false
	

func _physics_process(delta: float)-> void:
	
	if Input.is_action_just_pressed("ui_accept") && pathone == true:
		pathone = false
		pathtwo = true
	
	elif Input.is_action_just_pressed("ui_accept") && pathtwo == true:
		pathone = true
		pathtwo = false
	
	if pathone == true:
		position = pathOne.global_position
		print("I am path one")
		
	elif pathtwo == true:
		position = pathTwo.global_position
		rotation = pathTwo.global_rotation
		print("I am path two")
	
		
	#if Input.is_action_just_pressed("ui_accept"):
		#print("HELLO")
		#var randomPosition = Vector3.ZERO
		#randomPosition.z = randf_range(-5.0, 5.0)
		#randomPosition.x = randf_range(-5.0, 5.0)
		#randomPosition.y = randf_range(-5.0, 5.0)
		#navAgent.set_target_position(randomPosition)
		#
		#
	#var destination = navAgent.get_next_path_position()
	#var localDestination = destination - global_position
	#var direction = localDestination.normalized()
	#
	#
	#velocity = direction * 5
	move_and_slide()
