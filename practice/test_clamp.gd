extends KinematicBody2D

var max_speed = 200
var gravity = 80
var acceleration = 500

var direction = Vector2.ZERO
var velocity = Vector2.ZERO


func _ready():
	pass


func _process(delta):
	direction = Vector2.ZERO

	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	velocity.x += direction.x * acceleration * delta
	velocity.y += gravity * delta

	velocity.x = clamp(velocity.x, -max_speed, max_speed)
	velocity = move_and_slide(velocity, Vector2.UP)
