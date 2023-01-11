extends Button

signal buy_card
signal use_card
signal card_selected
signal card_unselected

export var price = 0

onready var gold_label = $Stats/Header/Gold
onready var game = get_tree().root.get_child(0)

func _ready():
	gold_label.text = str(price) + "g"

func _on_Card_button_down():
	emit_signal("card_selected")

func tile_filter(tile):
	pass
