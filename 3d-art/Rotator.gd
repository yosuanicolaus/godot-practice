extends Spatial

export var rotate_speed := 1.0


func _process(delta):
	self.rotate_y(rotate_speed * delta)
