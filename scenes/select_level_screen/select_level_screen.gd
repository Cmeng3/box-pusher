extends Control

@onready var v_box_container: VBoxContainer = $ScrollContainer/VBoxContainer

const BUTTON_THEME = preload("res://scenes/select_level_screen/button_theme.tres")

var levels: Array[PackedScene] = []

func _ready() -> void:
	const LEVEL_ONE = preload("res://scenes/levels/level_one/level_one.tscn")
	const LEVEL_TWO = preload("res://scenes/levels/level_two/level_two.tscn")
	const LEVEL_THREE = preload("res://scenes/levels/level_three/level_three.tscn")
	const LEVEL_FOUR = preload("res://scenes/levels/level_four/level_four.tscn")
	
	levels = [LEVEL_ONE, LEVEL_TWO, LEVEL_THREE, LEVEL_FOUR]
	
	var spacer1 = Control.new()
	spacer1.custom_minimum_size = Vector2(0, 100) # 40px vertical space
	v_box_container.add_child(spacer1)
	
	var i: int = 0
	
	for level in levels:
		i += 1
	
		var button: Button = Button.new()
		button.theme = BUTTON_THEME
		button.text = "Level %d" % i


		#if i > Progress.unlocked_level:
			#button.disabled = true

		button.pressed.connect(change_scene.bind(level))
		v_box_container.add_child(button)
	
	
	var spacer = Control.new()
	spacer.custom_minimum_size = Vector2(0, 40) # 40px vertical space
	v_box_container.add_child(spacer)
	
	var exit_button: Button = Button.new()
	exit_button.theme = BUTTON_THEME
	exit_button.text = "EXIT"
	exit_button.pressed.connect(_on_exit_pressed)
	v_box_container.add_child(exit_button)



func change_scene(new_scene: PackedScene):
	get_tree().change_scene_to_packed(new_scene)

func _on_exit_pressed():
	get_tree().quit()
