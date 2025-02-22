extends CharacterBody2D

@export var speed = 80

@onready var animated_sprite = $AnimatedSprite2D

var player = GlobalVariables.player

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	return input_direction

func move(input_direction):
	if not player.can_move: return

	velocity = input_direction * speed
	move_and_slide()

func animate(input_direction):
	if not player.can_move: return

	if input_direction.x > 0:
		animated_sprite.play("walk_right")
	elif input_direction.x < 0:
		animated_sprite.play("walk_left")
	elif input_direction.y > 0:
		animated_sprite.play("walk_down")
	elif input_direction.y < 0:
		animated_sprite.play("walk_up")

	if input_direction == Vector2.ZERO:
		animated_sprite.frame = 1

func _physics_process(delta):
	var input_direction = get_input()
	move(input_direction)
	animate(input_direction)