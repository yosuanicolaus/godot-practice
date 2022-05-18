tool
extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var i: int
var j: int


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	i = randi() % 2
	if i == 1:
		self.position.x += 1
	else:
		self.position.x -= 1

	j = randi() % 2
	if j == 1:
		self.position.y += 1
	else:
		self.position.y -= 1
