extends Control

#var day : String = Global.dayCount

func _ready() -> void:
	self.text = "Day: " + str(Global.dayCount)
	pass

func _process(delta: float) -> void:
	self.text = "Day: " + str(Global.dayCount)
	pass
