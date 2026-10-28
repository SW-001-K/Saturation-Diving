extends monsterstate
class_name pursueState
 
#for pursue, im thinking of a basic function that takes point A and B 
#Get the points from signals and stuff
#pursue is the code that handles monster going from point A to B 

#I will pseudocode hell today then. I deserve that at least. 

#var destination

#Physics_Update():

#if path != null:
		#if i < path.size()-1:
			#if t < 1:
				#print("I am in the first if case", t, "also, i value ", i)
				#position = position.lerp(path[i], t)
					#
			#elif t > 0.99:
				#print("I am in the second if case")
				#t = 0
				#i += 1
				#print("this is my current path", path[i], "this is the final path", path[path.size()-1])
