extends Panel



@onready var elevatorSound = $"../Elevator"
@onready var skipButton = $Skip
@onready var nextButton = $Next


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	elevatorSound.play()
	skipButton.pressed.connect(Skip)
	nextButton.pressed.connect(Next_Scene)
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func Next_Scene():
	print("YO I AM NEXT")
	elevatorSound.stop()
	get_tree().change_scene_to_file("res://scene/Habitat.tscn")
	


func Skip():
	elevatorSound.stop()
	get_tree().change_scene_to_file("res://scene/Habitat.tscn")
	


func _on_timer_timeout() -> void:
	pass # Replace with function body.
