extends Node2D

var occupied = {}
var cells = []

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			place_cell(event.position)
	
	if event.is_action_pressed("ui_accept"):
		for cell in cells:
			cell.visible = !cell.visible

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func place_cell(pos: Vector2):
	var cell_pos = get_grid_pos(pos)
	
	if cell_pos in occupied:
		remove_child(occupied[cell_pos])
		occupied.erase(cell_pos)
	else:
		var cell = $Cell.duplicate()
		cell.visible = true
		add_child(cell)
		occupied[cell_pos] = cell


func get_grid_pos(pos: Vector2):
	return pos.snapped(Vector2(32, 32))
