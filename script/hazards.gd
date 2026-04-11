extends Node2D

func _on_Area2Dspike_body_entered(body):
		if body is KinematicBody2D:
			var gs = get_tree().get_root().find_node("GameState", true, false)
			if gs:
				gs.player_hurt(body)
				print("Spike hit the player!")








func _on_Area2DSpikemen_body_entered(body):
		if body is KinematicBody2D:
			var gs = get_tree().get_root().find_node("GameState", true, false)
			if gs:
				gs.player_hurt(body)
				print("Spike hit the player!")
