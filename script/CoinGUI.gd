extends CanvasLayer

onready var coin = find_node("coin", true, false)

func _ready():
	yield(get_tree(), "idle_frame")
	
	var gs = get_tree().get_root().find_node("GameState", true, false)
	if gs:

		if not gs.is_connected("coins_changed", self, "_on_coins_changed"):
			gs.connect("coins_changed", self, "_on_coins_changed")
		
		if coin:
			coin.text = str(gs.coins)
		else:
			print("Error: Could not find the Label node!")

func _on_coins_changed(new_count):
	if coin:
		coin.text =  str(new_count)
