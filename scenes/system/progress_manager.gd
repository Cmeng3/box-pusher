extends Node

const SAVE_PATH = "user://progress.save"

var unlocked_level: int = 1


func _ready():
	load_progress()


func unlock_next_level(level_number: int):
	if level_number >= unlocked_level:
		unlocked_level = level_number + 1


func save_progress():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(unlocked_level)


func load_progress():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		unlocked_level = file.get_var()
	else:
		unlocked_level = 1
