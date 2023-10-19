extends CharacterBody2D


const maxspeed = 300
const acceleration = maxspeed * 5
const friction = maxspeed * 5


func _physics_process(delta):
	#sets a the built in variable Vector2 to change state when button is pressed
	var input_vector = Vector2.ZERO
	input_vector.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	input_vector.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	#normalized fixes double speed when moving diagonal
	input_vector = input_vector.normalized()
	
	
	#if input_vector is not the same as Vector2.ZERO 
	if input_vector != Vector2.ZERO:
		#sets velocity to real velocity to prevent velocity to increase while standing still. Move towards sets a curve to maxspeed with acceleration
		velocity = get_real_velocity().move_toward(input_vector * maxspeed, acceleration * delta) 
	else:
		#if input_vector/movementinput is not pressed 
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		
		
	#motion mode sets a mode for how move and slide works, 1 is recommended for topdown movement
	motion_mode = 1
	move_and_slide()
	
	
	#debug prints
	#print(velocity)
	#print(get_real_velocity())
