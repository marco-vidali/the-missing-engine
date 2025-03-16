extends Node

var last_room:
    get: return GlobalVariables.progress.last_room

func _ready():
    print(last_room)
    get_tree().change_scene_to_file(last_room)