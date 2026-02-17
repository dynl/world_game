extends KinematicBody2D

var motion = Vector2(0,0)
const SPEED = 100

func _physics_process(delta):
	motion = Vector2(0,0)
	
	# Horizontal Movement
	if Input.is_action_pressed("move_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("move_left"):
		motion.x = -SPEED
		
	# Vertical Movement (Up and Down)
	if Input.is_action_pressed("move_up"):
		motion.y = -SPEED
	elif Input.is_action_pressed("move_down"):
		motion.y = SPEED 
		
	move_and_slide(motion)
