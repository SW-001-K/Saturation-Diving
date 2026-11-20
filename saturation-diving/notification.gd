extends Control

#this is the notification script 
#what you can make you should make
#there are plugins but I wanna try doing this myself 

@onready var notifPanel = $notifPanel
@onready var sendNotif = $sendNotif
@onready var notifSFX = $notifSound

#signalz 
signal newThoughts
signal updatedThoughts

#when new notif is in put it here first. For what? For delays 
var notifQueue = ["empty"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sendNotif.pressed.connect(Send_Notifications)
	newThoughts.connect(Create_Notification)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Display_Notifications()
	

#Notifications should be its own class 
func Create_Notification():
	notifQueue.push_front("Hello")
	print (notifQueue)
	pass

	
#function to display notifications from the queue
func Display_Notifications():
	var delay
	var duration

	while notifQueue[0] != "empty":
		var notif =  Label.new()
		notif.text = "Hello"
		notifQueue.pop_front()
		notifPanel.add_child(notif)
		notifSFX.play()
	
	pass

func Send_Notifications():

	newThoughts.emit()
	pass
