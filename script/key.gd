extends Node2D

func _ready():
	if Global.has_key == true:
		queue_free()

func _on_Area2D_body_entered(body):
	print("Successfully obtain the key")
	if body.name == "player":
		Global.has_key = true
		$AnimationPlayer.play("key_anim")
	


