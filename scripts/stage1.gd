extends Node2D

# var ui_sprite : Node2D

func _ready() -> void:
    var game_in_ui = get_node("CanvasLayer/Control/HBoxContainer").get_children()
    game_in_ui[0].pressed.connect(self._on_title_pressed)
    game_in_ui[1].pressed.connect(self._on_next_pressed)


func _on_title_pressed() -> void:
    SceneManager.go_to_next_scene()

func _on_next_pressed() -> void:
    SceneManager.go_to_gameover()

func get_staged_line() -> Array[String]:
    var lines: Array[String] = [
        "hmm",
        "You're going the wrong way!",
        "Turn back!",
        "Go back!",
    ]

    return lines
