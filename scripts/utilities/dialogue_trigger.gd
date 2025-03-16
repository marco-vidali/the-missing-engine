extends Area2D

@export var dialogue = ""

@onready var player = %Player
@onready var raycast = player.get_node("RayCast2D")

var global_player = GlobalVariables.progress.player

func _process(delta):
	if raycast.get_collider() == self and Input.is_action_just_pressed("interact") and global_player.can_interact:
		Dialogic.start(dialogue)