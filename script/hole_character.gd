extends KinematicBody2D

var motion = Vector2(0,0)
const UP = Vector2(0,-1)

const GRAVITY = 10

const JUMP_SPEED = 500
const SPEED = 300


func _ready():
	OS.center_window()

func _apply_gravity():
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY

func _physics_process(delta):
	_apply_gravity()
	if Input.is_action_pressed("jump"):
		motion.y = -JUMP_SPEED
	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		motion.x = SPEED
	else:
		motion.x = 0
	move_and_slide(motion)


func _on_portal_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Global.char_position = Vector2(-244,646)
	get_tree().change_scene("res://World Map.tscn")
	
