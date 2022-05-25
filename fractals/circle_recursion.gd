extends Node2D

export var circle_radius = 456

var circle = preload("res://fractals/circle.tscn")
onready var screen = get_viewport_rect().size
onready var pointer = Vector2(screen.x / 2, screen.y / 2)


func _ready():
	var c = circle.instance()
	c.position = pointer
	add_child(c)
	recircle(c.scale, 6)


func recircle(scale: Vector2, level: int):
	if level == 0:
		return 
	
	var c = circle.instance()
	c.position = pointer
	c.scale = scale
	add_child(c)

	var original = pointer
	pointer.x -= circle_radius * scale.x
	recircle(c.scale / 2, level - 1)
	pointer = original
	pointer.x += circle_radius * scale.x
	recircle(c.scale / 2, level - 1)
	pointer = original
	pointer.y -= circle_radius * scale.y
	recircle(c.scale / 2, level - 1)
	pointer = original
	pointer.y += circle_radius * scale.y
	recircle(c.scale / 2, level - 1)
	pointer = original
