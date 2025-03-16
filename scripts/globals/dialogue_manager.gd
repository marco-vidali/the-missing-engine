extends Node

var global_player = GlobalVariables.progress.player

func _on_timeline_started():
	global_player.can_move = false
	global_player.can_interact = false

func _on_timeline_ended():
	global_player.can_move = true
	global_player.can_interact = true

func _ready():
	Dialogic.timeline_started.connect(_on_timeline_started)
	Dialogic.timeline_ended.connect(_on_timeline_ended)
