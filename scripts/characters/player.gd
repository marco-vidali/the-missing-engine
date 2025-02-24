extends CharacterBody2D

@export var speed = 80

@onready var animated_sprite = $AnimatedSprite2D
@onready var raycast = $RayCast2D

var global_player = GlobalVariables.player

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if not global_player.can_move: input_direction = Vector2.ZERO
	return input_direction

func move(input_direction):
	velocity = input_direction * speed
	move_and_slide()

func animate(input_direction):
	if input_direction.x > 0:
		animated_sprite.play("walk_right")
	elif input_direction.x < 0:
		animated_sprite.play("walk_left")
	elif input_direction.y > 0:
		animated_sprite.play("walk_down")
	elif input_direction.y < 0:
		animated_sprite.play("walk_up")

	if velocity == Vector2.ZERO:
		animated_sprite.frame = 1

func rotate_raycast(input_direction):
	if input_direction.x > 0:
		raycast.rotation_degrees = 90
	elif input_direction.x < 0:
		raycast.rotation_degrees = 270
	elif input_direction.y > 0:
		raycast.rotation_degrees = 180
	elif input_direction.y < 0:
		raycast.rotation_degrees = 0

func _physics_process(delta):
	var input_direction = get_input()

	move(input_direction)
	animate(input_direction)
	rotate_raycast(input_direction)