extends Area2D

@export var destination = ""
@onready var player = %Player

var global_player = GlobalVariables.progress.player

func _on_body_entered(body):
	if body == player:
		Transition.transition()
		await Transition.transition_finished

		global_player.position.x = null
		global_player.position.y = null

		get_tree().change_scene_to_file("res://" + destination)
