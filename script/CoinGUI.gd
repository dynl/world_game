extends CanvasLayer

# 1. Use the EXACT name of your label node here
onready var coin = find_node("coin", true, false)

func _ready():
	yield(get_tree(), "idle_frame")
	
	var gs = get_tree().get_root().find_node("GameState", true, false)
	if gs:
		# Connect signal
		if not gs.is_connected("coins_changed", self, "_on_coins_changed"):
			gs.connect("coins_changed", self, "_on_coins_changed")
		
		# 2. Only try to set text if the label actually exists
		if coin:
			coin.text = str(gs.coins)
		else:
			print("Error: Could not find the Label node!")

func _on_coins_changed(new_count):
	if coin:
		coin.text =  str(new_count)
