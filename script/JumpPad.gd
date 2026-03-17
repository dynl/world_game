extends Area2D

func _on_JumpPad_body_entered(body):
	if body.has_method("_boost"): # Best practice: check if the method exists first
		$AnimationPlayer.play("boost")
		body._boost() # Added the underscore here to match your character script
