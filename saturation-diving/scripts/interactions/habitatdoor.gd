extends Interactable


func interact(body):
	Global.dayEnd.emit("exit")
	print("I am the door")
