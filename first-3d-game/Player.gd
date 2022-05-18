extends KinematicBody

export var speed = 14
export var gravity = 75
var velocity = Vector3.ZERO


func _ready():
	pass


func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1
	if Input.is_action_pressed("ui_down"):
		direction.z += 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(translation + direction, Vector3.UP)

	velocity.x += direction.x * speed * delta
	velocity.z += direction.z * speed * delta
	velocity.y -= direction.y * delta

	velocity = move_and_slide(velocity, Vector3.UP)
