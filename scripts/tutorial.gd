extends Node2D

func _ready() -> void:
    var gamein_ui = get_node("CanvasLayer/Control").get_children()
    gamein_ui[0].pressed.connect(self._on_title_pressed)


func _on_title_pressed() -> void:
    get_tree().change_scene_to_file("res://scenes/title.tscn")

func get_staged_line() -> Array[String]:
    var lines: Array[String] = [
        "tutorial tutorial",
        "late late",
        "lets gooooooooo"
    ]

    return lines