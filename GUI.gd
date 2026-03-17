extends CanvasLayer

func _ready():
	var gs = get_tree().get_root().find_node("GameState", true, false)
	if gs:
		gs.connect("health_changed", self, "_update_health")
		_update_health(gs.current_health)

func _update_health(value):
	$Control/TextureRect/HBoxContainer/life.text = str(value)
