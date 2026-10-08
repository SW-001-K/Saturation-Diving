extends CharacterBody3D

@onready var pathOne = $"../Patrol 1/PathFollow3D/Patrol1"
@onready var pathTwo = $"../Patrol 2/PathFollow3D/Patrol2"
#@onready var navAgent: NavigationAgent3D = $NavigationAgent3D
var pathone :bool
var pathtwo :bool 
var path
var speed = 3
var t = 0.0
var i = 0

func _ready() -> void:
	position = pathOne.global_position
	print(pathOne.global_position)
	pathone = true
	pathtwo = false

	
func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout

func pursue(path, i, nextDir, delta: float):
	t += delta * 0.5
	print(t)
	for Vector3 in path:
		if i < path.size()-2:
			i += 1 
			print(path.size())
			nextDir = path[i+1]
			position = path[i].lerp(path[i+1], t)
			print(nextDir)
			print(i)
			await wait(t)

	

func _physics_process(delta: float)-> void:
#If you have a point A in a for loop iteration, you can use
#var next_dir = A.direction_to(B)
	if Input.is_action_just_pressed("ui_accept") && pathone == true:
		path = $"../FlightNavigation3D".find_path(position,pathTwo.global_position)
		print(path)
		
		
	t += delta * 0.9
	#position = pathOne.global_position.lerp(pathTwo.global_position, t)
	if path != null:
		if i < path.size()-1:
			if t < 1:
				print("I am in the first if case", t, "also, i value ", i)
				position = position.lerp(path[i], t)
					
			elif t > 0.99:
				print("I am in the second if case")
				t = 0
				i += 1
				print("this is my current path", path[i], "this is the final path", path[path.size()-1])
				
		
			

	#

		#path = $"../FlightNavigation3D".find_path(position,pathTwo.global_position)
		#print(path)
		#var nextDir 
		#var i = 0
		#pursue(path, i, nextDir, delta)
		#pathone = false
		#pathtwo = true
		#
		#
	#
	#elif Input.is_action_just_pressed("ui_accept") && pathtwo == true:
		#path = $"../FlightNavigation3D".find_path(global_position,pathOne.global_position)
		#print(path)
		#var nextDir 
		#var i = 0
		#pursue(path, i, nextDir, delta)
#
		#pathone = true
		#pathtwo = false

	#
	#if pathone == true:
		#position = pathOne.global_position
		#print("I am path one")
		#
	#elif pathtwo == true:
		#position = pathTwo.global_position
		#rotation = pathTwo.global_rotation
		#print("I am path two")
	##
		
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
