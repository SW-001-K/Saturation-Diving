extends Interactable

#This is for the bell

func interact(body):
	Global.dayEnd.emit("enter")
