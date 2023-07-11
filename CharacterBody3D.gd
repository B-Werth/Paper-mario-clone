extends CharacterBody3D







const JUMP_VELOCITY = 5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var animation = $AnimationPlayer
@onready var animationTree = $AnimationTree




func _physics_process(delta):
	var SPEED = 5.0
	

	
	
	if not is_on_floor():
		velocity.y -= gravity * delta
		
			
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	if Input.is_action_pressed("dash") and is_on_floor():
		SPEED = 8

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()


	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED




	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)


	if input_dir == Vector2.ZERO:
		animationTree.get("parameters/playback").travel("idle")
	else:
		animationTree.get("parameters/playback").travel("run")
		animationTree.set("parameters/idle/blend_position", input_dir)
		animationTree.set("parameters/run/blend_position", input_dir)

	


	move_and_slide()
	



		
		

		
		
		


