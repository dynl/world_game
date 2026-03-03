extends Node2D

func _on_Area2D_body_entered_flashlight(body):
	print("Successfully obtain the flashlight")
	Global.has_flashlight = true
	$AnimationPlayer.play("key_anim")

func _die():
	queue_free()
