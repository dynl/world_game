extends Node2D

var collected = false

func _on_Area2D_body_entered(body):
	if collected:
		return
	

	if body.name == "hole_character" or body is KinematicBody2D:
		collected = true
		

		var gs = get_tree().get_root().find_node("GameState", true, false)
		if gs:
			gs.add_coin()
		

		visible = false
		$Area2D/CollisionShape2D.set_deferred("disabled", true)
		
		if has_node("CoinSFX"):
			$CoinSFX.play()
			yield($CoinSFX, "finished") 
		
		queue_free()
