extends Node


func _process(delta):
	owner.rotation_degrees += 1
	owner.position.y -= 80 * delta
