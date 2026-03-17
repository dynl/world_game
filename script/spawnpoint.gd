extends Area2D

export var respawn_offset = Vector2(0, -10)

func _on_spawnpoint_body_entered(body):
	# Check if the body is the player
	if body is KinematicBody2D:
		# Search the scene for the node named "GameState"
		var gs = get_tree().get_root().find_node("GameState", true, false)
		
		if gs:
			# Save the global position to the local GameState node
			gs.update_checkpoint(global_position + respawn_offset)
			modulate = Color(0, 1, 0) # Turns green when touched
		else:
			print("Error: No GameState node found in this scene!")
