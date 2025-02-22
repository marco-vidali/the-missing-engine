extends Node

var player:
	set(value): GlobalVariables.player = value

func _on_timeline_started():
	player.can_move = false

func _on_timeline_ended():
	player.can_move = true

func _ready():
	Dialogic.timeline_started.connect(_on_timeline_started)
	Dialogic.timeline_started.connect(_on_timeline_ended)
