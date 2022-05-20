extends Node2D

export(int) var mover_count = 20
var mover = preload("res://Mover/Mover.tscn")
onready var screen = get_viewport_rect().size


func _ready():
	randomize()
	for i in mover_count:
		var m = mover.instance()
		m.position = Vector2(randf() * screen.x, randf() * screen.y)
		add_child(m)
