extends Control

#this is the notification script 
#what you can make you should make
#there are plugins but I wanna try doing this myself 

@onready var notifPanel = $notifPanel
@onready var sendNotif = $sendNotif
@onready var notifSFX = $notifSound
var i : int

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

	pass

	

#Notifications should be its own class 
func Create_Notification():
	var string = "hello" + str(i)
	notifQueue.push_front(string)
	i = i + 1
	print (notifQueue)
	pass

	
#function to display notifications from the queue
func Display_Notifications():
	var delay
	var duration
	#print(notifQueue)
	#while notifQueue[0] != "empty":
		#timer()
	
	pass

func Send_Notifications():

	newThoughts.emit()
	pass


func timerDelay() -> void:
	if notifQueue[0] != "empty":
		var notif =  Label.new()
		notif.text = notifQueue[0]
		notifQueue.pop_front()
		notifPanel.add_child(notif)
		notifSFX.play()
			
	pass # Replace with function body.


func timerDuration() -> void:
	if notifPanel.get_child_count()!= 0:
		print("I have a child")
		var notif = notifPanel.get_child(0)
		print (notif)
		notif.queue_free()
		
	pass # Replace with function body.
