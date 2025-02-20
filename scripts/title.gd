extends Control

func _ready() -> void:
    var start_menu = get_node("MarginContainer/VBoxContainer").get_children()
    start_menu[0].start_pressed.connect(self._on_start_pressed)
    start_menu[1].pressed.connect(self._on_quit_pressed)

    start_menu[0].grab_focus()

func _on_start_pressed(key) -> void:
    if key == "right":
        get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
    if key == "left":
        get_tree().change_scene_to_file("res://scenes/stage_1.tscn")


func _on_quit_pressed() -> void:
    get_tree().quit()
