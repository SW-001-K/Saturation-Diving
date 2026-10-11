extends Control
@onready var label = $Panel/Label
@onready var title = $Panel/Title
@export var content: LogData

func _ready() -> void:
	Global.requestLogInfo.connect(displayLogInfo)
	
func displayLogInfo(LogID):
	print("I receive the signal:", LogID)
	title.text = LogID.title
	label.text = LogID.description
