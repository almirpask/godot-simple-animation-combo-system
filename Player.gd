extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 80
const FRICTION = 500
const ROLL_SPEED = 125

var velocity = Vector2.ZERO
var current_animation = 1
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()	
	if input_vector != Vector2.ZERO:		
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:	
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta) 
	velocity = move_and_slide(velocity)
	
	if Input.is_action_just_pressed("atack"):		
		var animation_name = "atack%s"
		$AnimationPlayer.play(animation_name % current_animation)
		current_animation += 1
	if current_animation > 3:
		current_animation = 1 
	
