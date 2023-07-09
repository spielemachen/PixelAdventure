extends CharacterBody2D

@export var gravity: float = 200
@export var move_speed: float = 50
@export var jump_impulse: float = 120

@onready var sprite = $Sprite2D

var double_jump_used = false

func _physics_process(delta):
	#velocity.y = velocity.y + gravity * delta
	velocity.y += gravity * delta

	velocity.x = Input.get_axis("move_left", "move_right") * move_speed

	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y -= jump_impulse
		elif not double_jump_used:
			velocity.y -= jump_impulse
			double_jump_used = true
		velocity.y = max(velocity.y, -jump_impulse)

	if is_on_floor():
		double_jump_used = false

	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false

	move_and_slide()
