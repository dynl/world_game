extends Node

signal health_changed(new_health)
signal coins_changed(new_count)

var max_health = 3
var current_health = 3
var coins = 0
var is_invincible = false
var current_checkpoint_pos = Vector2.ZERO

func _ready():
	current_health = max_health

func add_coin():
	coins += 1
	if coins >= 10:
		coins = 0
		current_health += 1
		
		emit_signal("health_changed", current_health)
		print("Reward triggered! Current Health: ", current_health)
	emit_signal("coins_changed", coins)
	
	
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

func update_checkpoint(new_pos):
	current_checkpoint_pos = new_pos

func die():
	current_health = max_health
	coins = 0 
	is_invincible = false
	get_tree().change_scene("res://scene/GameCover.tscn")
