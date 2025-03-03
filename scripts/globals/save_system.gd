extends Node

var save_file_path:
	get: return GlobalVariables.save_file_path

var save_data:
	get: return GlobalVariables.save_data
	set(value): GlobalVariables.save_data = value

func deep_merge(target: Dictionary, source: Dictionary) -> void:
	for key in source:
		if key in target:
			if target[key] is Dictionary and source[key] is Dictionary:
				deep_merge(target[key], source[key])
			else:
				target[key] = source[key]
		else:
			target[key] = source[key]

func save_game():
	var save_file = FileAccess.open(save_file_path, FileAccess.WRITE)
	save_file.store_var(save_data)
	save_file.close()

func load_game():
	if FileAccess.file_exists(save_file_path):
		var save_file = FileAccess.open(save_file_path, FileAccess.READ)
		var loaded_state = save_file.get_var()
		save_file.close()
		
		var merged_state = save_data.duplicate(true)
		deep_merge(merged_state, loaded_state)
		save_data = merged_state
	else:
		save_game()

func _ready():
	load_game()
