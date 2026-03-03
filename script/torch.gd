extends Node2D

func _on_Area2D_body_entered(body):
	print("Torch collected! Darkness is clearing.")
	$AnimationPlayer.play("key_anim")
	Global.has_torch = true
	var canvas_mod = get_parent().get_node("CanvasModulate")
	if canvas_mod:
		canvas_mod.visible = false
		
	queue_free()
