extends Control

#main menu script

@onready var play = $PlayButton
@onready var exit = $ExitButton
@onready var credit = $CreditButton

@onready var BGM = $MainMenuBGM
@onready var hover = $Hover
@onready var click = $Click

@onready var triPlay = $Play/Triangle1
@onready var triExit = $Exit/Triangle2
	
var hovering: bool = false
var dragging: bool = true
var event : InputEventMouseButton


func _ready() -> void:
	play.pressed.connect(playButton)
	exit.pressed.connect(exitButton)
	credit.pressed.connect(creditButton)

	
	play.mouse_entered.connect(playHoverSound)
	exit.mouse_entered.connect(playHoverSound)

	triPlay.hide()
	triExit.hide()
	
	#BGM.play()
	
	pass
	
	
func _process(delta: float) -> void:
	if exit.is_hovered() == true:
		triExit.show()
	
		
	else: triExit.hide()
	
	if play.is_hovered() == true:
		triPlay.show()

		
	else: triPlay.hide()
	
	pass

func playButton():
	playClickSound()
	await get_tree().create_timer(1.1).timeout 
	BGM.stop()
	get_tree().change_scene_to_file("res://scene/Habitat.tscn")
	pass
	
func exitButton():
	playClickSound()
	pass 

func creditButton():
	playClickSound()
	pass
	
func playHoverSound():
	hover.play()
	
func playClickSound():
	click.play()
	
	
