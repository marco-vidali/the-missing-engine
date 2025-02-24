extends Area2D

@export var dialogue = ""

@onready var player = %Player
@onready var raycast = player.get_node("RayCast2D")
@onready var can_interact:
	get: return GlobalVariables.player.can_interact

func _process(delta):
	if raycast.get_collider() == self and Input.is_action_just_pressed("interact") and can_interact:
		Dialogic.start(dialogue)