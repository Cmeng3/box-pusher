extends Control

@onready var button: Button = $VBoxContainer/Button
@onready var victory_sound: AudioStreamPlayer2D = $VictorySound

const SELECT_LEVEL_SCREEN = preload("res://scenes/select_level_screen/select_level_screen.tscn")

func _ready() -> void:
	button.pressed.connect(on_button_pressed)
	victory_sound.play()

func on_button_pressed() -> void:
	get_tree().change_scene_to_packed(SELECT_LEVEL_SCREEN)
