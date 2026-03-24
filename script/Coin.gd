extends Node2D

var collected = false

func _on_Area2D_body_entered(body):
	if collected:
		return
	
	# Check if the thing hitting the coin is the player
	if body.name == "hole_character" or body is KinematicBody2D:
		collected = true
		
		# FIND THE GAMESTATE NODE IN THE SCENE
		var gs = get_tree().get_root().find_node("GameState", true, false)
		if gs:
			gs.add_coin()
		
		# REQUIREMENT: Vanish immediately
		visible = false
		$Area2D/CollisionShape2D.set_deferred("disabled", true)
		
		# REQUIREMENT: Sound plays before disappearing
		if has_node("CoinSFX"):
			$CoinSFX.play()
			yield($CoinSFX, "finished") 
		
		queue_free()
