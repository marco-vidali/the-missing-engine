extends Node

var save_file_path = GlobalVariables.save_file_path
var progress = GlobalVariables.progress

func deep_merge(dict1: Dictionary, dict2: Dictionary) -> void:
	for key in dict2.keys():
		if dict2[key] is Dictionary and dict1.has(key) and dict1[key] is Dictionary:
			deep_merge(dict1[key], dict2[key])
		else:
			dict1[key] = dict2[key]

func save_game():
	var json = JSON.stringify(progress)
	var save_file = FileAccess.open(save_file_path, FileAccess.WRITE)
	save_file.store_line(json)
	save_file.close()

func load_game():
	if FileAccess.file_exists(save_file_path):
		var save_file = FileAccess.open(save_file_path, FileAccess.READ)
		var json = save_file.get_as_text()
		save_file.close()

		var save_progress = JSON.parse_string(json)
		deep_merge(progress, save_progress)
	else:
		save_game()

func _ready():
	load_game()
