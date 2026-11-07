extends monsterstate
class_name transitionState
var i = 0
var t = 0.0
var tempPath
var tempPathFollow 
var curve : Curve3D
var pathCreated : bool = false

@onready var parent : Node3D = $"../../.."
#handles transition between pathways.
#from path A to path B
#current path to next path

func Enter():
	print("I am transition")
	tempPath = Path3D.new()
	parent.add_child(tempPath) #this makes a temporary path
	tempPathFollow = PathFollow3D.new()
	tempPath.add_child(tempPathFollow)

	
#function to create curves
func Create_Curve(arrayList) -> Curve3D:
	
	var newCurve : Curve3D
	newCurve = Curve3D.new()
			
	for i in arrayList.size():
		# for debugging; alternative do if point == null: continue # or whatever godot has for null check
		newCurve.add_point(arrayList[i])
		pass
	return newCurve

#sets the path ONCE
func Create_Path():
	if pathCreated == false:
		var path = flightNavigation.find_path(monster.global_position, nextPath.global_position)
		tempPath.set_curve(Create_Curve(path))
		pathCreated = true
		
func Transition(delta):
	if nextPath != null:
		Create_Path()

	#this is stupid fr fr so true
	if tempPathFollow.progress_ratio < 0.99:
		tempPathFollow.progress_ratio += 0.01 * monsterSpeed
		#print(tempPathFollow.progress_ratio)
			
		#don't forget to add lerp so it smoothens out but I think it's decent
		monster.global_position =  tempPathFollow.global_position
		monster.global_rotation =  tempPathFollow.global_rotation
		
	else: 
		t += delta * 0.9
		monster.position = monster.position.lerp(nextPath.global_position, t)
		print(t)
		
		
		#the lerp way which is bad
		#t += delta * 0.9
		#if path != null:
			#if i < path.size()-1:
				#if t < 1:
					#print("I am in the first if case ", t, "also, i value ", i)
					#monster.position = monster.position.lerp(path[i], t)
#
						#
				#elif t > 0.99:
					#print("I am in the second if case")
					#t = 0
					#i += 1
					#print("this is my current path", path[i], "this is the final path", path[path.size()-1])
					#print("current path is ", currentPath, "next path is ", nextPath)
			#
		

	
func Update(_delta:float):
	Transition(_delta)
	pass
	
	
