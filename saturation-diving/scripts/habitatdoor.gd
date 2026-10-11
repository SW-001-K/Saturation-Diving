extends Interactable


func interact(body):
	print("I am the door")
	get_tree().change_scene_to_file("res://scene/main.tscn")
