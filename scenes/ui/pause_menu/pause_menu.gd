extends CanvasLayer

@onready var resume_button = $Panel/VBoxContainer/Resume
@onready var reset_button = $Panel/VBoxContainer/Reset
@onready var menu_button = $Panel/VBoxContainer/Menu

func _ready():
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS

	resume_button.pressed.connect(_on_resume_pressed)
	reset_button.pressed.connect(_on_reset_pressed)
	menu_button.pressed.connect(_on_menu_pressed)

func toggle():
	get_tree().paused = !get_tree().paused
	visible = get_tree().paused

func _on_resume_pressed():
	get_tree().paused = false
	visible = false

func _on_reset_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/select_level_screen/select_level_screen.tscn")
