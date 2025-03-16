extends Area2D

@export var destination = ""
@onready var player = %Player

var global_player = GlobalVariables.progress.player
var last_room:
	set(value): GlobalVariables.progress.last_room = value

func _on_body_entered(body):
	if body == player:
		Transition.transition()
		await Transition.transition_finished

		global_player.position.x = null
		global_player.position.y = null

		last_room = destination
		get_tree().change_scene_to_file(destination)
