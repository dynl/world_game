extends Node

signal health_changed(new_health)

var max_health = 3
var current_health = 3
var is_invincible = false
var current_checkpoint_pos = Vector2.ZERO

func _ready():
	current_health = max_health

func player_hurt(player_node):
	if is_invincible:
		return
	
	is_invincible = true 
	current_health -= 1
	emit_signal("health_changed", current_health)

	if player_node.has_node("hurt"):
		player_node.get_node("hurt").play()

	if current_health <= 0:
		die()
	else:
		yield(get_tree().create_timer(1.0), "timeout")
		is_invincible = false

func die():
	current_health = max_health
	is_invincible = false
	# Note: Scene change will destroy this local GameState
	get_tree().change_scene("res://scene/GameCover.tscn")

func update_checkpoint(new_pos):
	current_checkpoint_pos = new_pos

func change_to_world_map():
	get_tree().change_scene("res://World Map.tscn")
