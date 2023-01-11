extends Node2D

export var columns = 8
export var rows = 8
export (NodePath) var camera_path
onready var camera = get_node(camera_path)
var cam_speed = Vector2()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)

func _input(event):
	if event is InputEventMouseMotion:
		var mouse = get_tree().root.get_mouse_position()
		var visible_rect = get_tree().root.get_visible_rect()
		cam_speed.x = int(mouse.x >= visible_rect.end.x - 1) - int(mouse.x <= visible_rect.position.x)
		cam_speed.y = int(mouse.y >= visible_rect.end.y - 1) - int(mouse.y <= visible_rect.position.y)

	if event is InputEventMouseButton:
		var zoom = 1
		if event.button_index == BUTTON_WHEEL_DOWN:
			zoom = clamp(camera.zoom.x + (event.factor*1.1), 0.1, 3)
			camera.zoom = Vector2(1, 1) * zoom 
		elif event.button_index == BUTTON_WHEEL_UP:
			zoom = clamp(camera.zoom.x - (event.factor*1.1), 0.1, 3)
			camera.zoom = Vector2(1, 1) * zoom

func _process(delta):
	if cam_speed:
		camera.offset += cam_speed*250*delta * camera.zoom
