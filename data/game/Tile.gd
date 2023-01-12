extends Button

signal tile_clicked
signal tile_entered
signal tile_occupied

var coords = Vector2()
var team_occupied
var selected_card

func highlight_green(value, card = null):
	var tilemap = get_parent().get_parent().get_node("GreenHighlight")
	tilemap.set_cellv(coords, 0 + int(value) - 1)
	disabled = not value
	selected_card = card

func _on_button_down():
	selected_card.action(self)
