extends Interactable

#This is for the bell

func interact(body):
	print("I am the bell")
	get_tree().change_scene_to_file("res://scene/Habitat.tscn")
