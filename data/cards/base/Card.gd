extends Button

signal buy_card
signal use_card
signal card_selected
signal card_unselected
signal card_used

export var price = 0

onready var gold_label = $Stats/Header/Gold
onready var game = get_tree().root.get_child(0)
onready var grid = game.get_node("Grid")

func _ready():
	gold_label.text = str(price) + "g"
	connect("card_selected", grid, "_on_card_selected", [self])
	connect("card_unselected", grid, "_on_card_unselected", [self])

func _on_Card_button_down():
	emit_signal("card_selected")

func action(tile):
	tile.text = "SHIIIT"
	emit_signal("card_used")

func tile_filter(tile):
	return true

func _on_card_used():
	emit_signal("card_unselected")
	#queue_free()
	hide()

func _on_focus_exited():
	yield(get_tree().create_timer(0.0001), "timeout")
	if weakref(self).get_ref():
		emit_signal("card_unselected")
