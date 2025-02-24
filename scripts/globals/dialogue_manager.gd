extends Node

var player = GlobalVariables.player

func _on_timeline_started():
	player.can_move = false
	player.can_interact = false

func _on_timeline_ended():
	player.can_move = true
	player.can_interact = true

func _ready():
	Dialogic.timeline_started.connect(_on_timeline_started)
	Dialogic.timeline_ended.connect(_on_timeline_ended)
