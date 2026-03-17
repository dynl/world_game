extends KinematicBody2D

var motion = Vector2(0,0)
const UP = Vector2(0,-1)

const GRAVITY = 25
const JUMP_SPEED = 700
const SPEED = 300
const WORLD_LIMIT = 1000
const BOOST_MULTIPLIER = 2.5

func _physics_process(_delta):
	_apply_gravity()
	_handle_input()
	motion = move_and_slide(motion, UP)

	if position.y > WORLD_LIMIT:
		respawn_player()

func _apply_gravity():
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY

func _handle_input():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		motion.y = -JUMP_SPEED
		if has_node("jump"):
			$jump.play()
		
	if Input.is_action_pressed("move_left"):
		motion.x = -SPEED
	elif Input.is_action_pressed("move_right"):
		motion.x = SPEED
	else:
		motion.x = 0

# THIS IS THE FUNCTION THE JUMPPAD CALLS
func _boost():
	motion.y = -JUMP_SPEED * BOOST_MULTIPLIER

func respawn_player():
	var gs = get_tree().get_root().find_node("GameState", true, false)
	if gs:
		global_position = gs.current_checkpoint_pos
		gs.player_hurt(self)
	else:
		get_tree().reload_current_scene()
	motion = Vector2.ZERO


func _on_portal_body_entered(body):
	Global.char_position = Vector2(76,317)
	get_tree().change_scene("res://World Map.tscn")
