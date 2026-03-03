extends Node2D


func _ready():
	if Global.has_flashlight:
		$flashlight._die()
