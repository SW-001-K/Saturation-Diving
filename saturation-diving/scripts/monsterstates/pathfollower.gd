extends PathFollow3D
@export var pathName : String

var monsterSpeed = 1

func _physics_process(delta: float) -> void:
	progress_ratio += 0.0001 * monsterSpeed
	
	pass
