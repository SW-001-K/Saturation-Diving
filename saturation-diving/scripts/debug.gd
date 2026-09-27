extends Control 
class_name Debug

var properties: Array

@onready var container = $Panel/VBoxContainer
# Called when the node enters the scene tree for the first time.

const fps_ms = 16

func _ready() -> void:
	Global.debug = self
	visible = true

func addDebugProperty(id: StringName, value, time_in_frames) -> void:
	if properties.has(id):
		if Time.get_ticks_msec()/ fps_ms % time_in_frames == 0:
			var target = container.find_child(id, true, false) as Label
			target.text = id + ": " + str(value)
		
	else:
		var property = Label.new()
		container.add_child(property)
		property.name = id
		property.text = id + ": " + str(value)
		properties.append(id)
