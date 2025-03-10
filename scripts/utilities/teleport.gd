extends Area2D

@export var destination = ""

@onready var player = %Player

func _on_body_entered(body):
    if body == player:
        get_tree().change_scene_to_file("res://" + destination)