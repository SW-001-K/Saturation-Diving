extends CharacterBody3D

@export var stand_collider : CollisionShape3D
@export var crouch_collider : CollisionShape3D


#		Characteristics
var speed : float = 6.0

@export var jump_vel : float = 5.0                                              # @export lets you see and change values in the Inspector

var input_dir : Vector2
var direction : Vector3

enum STATES {IDLE, SPRINT, CROUCH, JUMP, FALL}
var prev_state : STATES
var state : STATES
signal state_change(new_state)                                                  # You know signals, this lets you use the state outside of the player
"disable_mode"
#This is for creating raycasts with code, don't worry about it
@onready var space_state = get_world_3d().direct_space_state

func set_state(new_state: STATES):
	
	#    Prev_state stores old state and new state is usable for checks;    Match...case changes attributes
	
	prev_state = state
	
	# If you crouch under a table or something, you won't be able to stand until you're out
	#region Height Check
	if prev_state == STATES.CROUCH:
		var origin = position + Vector3(0, -0.70, 0)
		var target = origin + Vector3(0, 3.0, 0)
		var ray_query = PhysicsRayQueryParameters3D.create(origin, target)
		var head_collisions = space_state.intersect_ray(ray_query)
		
		if head_collisions:
			var roof = origin.distance_to(head_collisions["position"])
			print("Collided with roof ->\t", roof, "m")
			
			if roof < 1.4: 
				print("Crouch forced")
				new_state = STATES.CROUCH
		else:
			print("No roof")
		
	#endregion
	
	#region Conditional Switches                    if prev not in allowed_STATES => set_state(IDLE) maybe
	match new_state:
		
		STATES.IDLE:
			var tween = create_tween()                                          # tweens are lightweight, temporary and short animations
			
			jump_vel = 5.0
			speed = 6.0
			
			stand_collider.disabled = false
			crouch_collider.disabled = true
			
			tween.tween_property(%Camera3D,"position", Vector3(0,0.55, 0), 0.2).set_trans(Tween.TRANS_QUAD)
			
			print("idle state")
		
		STATES.SPRINT:
			
			if prev_state == STATES.IDLE: 
				jump_vel = 6.0
				speed = 10.0
				
				stand_collider.disabled = false
				crouch_collider.disabled = true
				
				print("sprint state")
			else:
				return false
		
		STATES.CROUCH:
			var tween = create_tween()
			
			jump_vel = 4.0
			speed = 3.0
			
			crouch_collider.disabled = false
			stand_collider.disabled = true
			
			tween.tween_property(%Camera3D,"position", Vector3(0,-0.15, 0), 0.2).set_trans(Tween.TRANS_QUAD)
			print("crouch state")
		
		STATES.JUMP:
			print("jump state")
		
		STATES.FALL:
			print("fall state")
		
	state = new_state
	#print("PREV		", prev_state, "\nNOW		", state)
	state_change.emit(state)
	#endregion

func _ready() -> void:
	set_state(STATES.IDLE)


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# input = (1.0, 1.0) 	; direction = (1.0, 0.0, 1.0)
	input_dir = Input.get_vector("left", "right", "forward", "back")
	
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	direction = direction.rotated(Vector3.UP, %Camera3D.global_rotation.y)
	
	# Add the gravity     I changed this for more organic falling
	if !is_on_floor():
		if velocity.y >= 0.0:
			velocity += get_gravity() * delta * 1.5
		else:
			velocity += get_gravity()  * delta * 2
		
	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += jump_vel
	
	if direction:                                                               # This will give you velocity in the facing direction
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	elif !direction:                                                            # When you don't have direction, move_toward will act like friction
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	
	if Input.is_action_just_pressed("sprint") and state != STATES.SPRINT:
		set_state(STATES.SPRINT)
	
	if input_dir == Vector2(0, 0) and state == STATES.SPRINT:
		set_state(STATES.IDLE)
	
	if Input.is_action_pressed("crouch") and state != STATES.CROUCH:
		set_state(STATES.CROUCH)
	if Input.is_action_just_released("crouch"):
		set_state(STATES.IDLE)
	
	if get_last_motion().y < 0 and state in [STATES.IDLE, STATES.SPRINT, STATES.JUMP]:
		set_state(STATES.FALL)
	
	if is_on_floor() and state == STATES.FALL:
		set_state(STATES.IDLE)
	
	move_and_slide()
	
	if Input.is_action_just_pressed("controls"):
		if $"UI/UI lol".visible:
			$"UI/UI lol".hide()
		elif !$"UI/UI lol".visible:
			$"UI/UI lol".show()
	
	#region Dev Options
	# You can add anything you wanna test in this thing
	if Input.is_action_just_pressed("dev 1"):
		position = Vector3(0, 2.0, 0);
	
	if Input.is_action_just_pressed("dev 2"):
		#This is the line to switch scenes too, like from a main menu and next levels. You'll have to see how pause menus work yourself :P
		get_tree().change_scene_to_file("res://scenes/GYM.tscn")
	
	if Input.is_action_just_pressed("dev 3"):
		pass
		
	if Input.is_action_just_pressed("dev 4"):
		pass
	
	if Input.is_action_just_pressed("dev 9"):
		pass
	
	#endregion
	
