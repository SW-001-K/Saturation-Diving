extends Control
@onready var label = $Panel/Label
@onready var title = $Panel/Title

func _ready() -> void:
	Global.requestLogInfo.connect(displayLogInfo)
	
func displayLogInfo(thoughtID):
	print("I receive the signal:", thoughtID)
	if thoughtID == 0:
		title.text = "I am a chud"
		label.text = "I'm a chud, I'm a chud, I'm a fat little chud"
		
	elif thoughtID == 1:
		title.text = "Kotu"
		label.text = "Kotu is a bird"
		
	elif thoughtID == 2:
		title.text = "KMS"
		label.text = "Me when I"
