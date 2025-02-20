extends Node2D

func _ready() -> void:
    var game_in_ui = get_node("CanvasLayer/Control/HBoxContainer").get_children()
    game_in_ui[0].pressed.connect(self._on_title_pressed)
    game_in_ui[0].pressed.connect(self._on_next_pressed)



func _on_title_pressed() -> void:
    get_tree().change_scene_to_file("res://scenes/title.tscn")

func _on_next_pressed() -> void:
    get_tree().change_scene_to_file("res://scenes/stage_3.tscn")