extends Interactable


@onready var BGM = $jazzBGM
var audioPlaying : bool = false 


func interact(body):

	if audioPlaying:
		print("I am turned off :(")
		audioPlaying = false
		BGM.stop()
		pass
	
	else:
		print("I am turned on :3")
		audioPlaying = true
		BGM.play()
		pass

func _process(delta: float) -> void:
	
	pass
