extends Node2D

# var ui_sprite : Node2D

func _ready() -> void:
    var game_in_ui = get_node("CanvasLayer/Control/HBoxContainer").get_children()
    game_in_ui[0].pressed.connect(self._on_title_pressed)
    game_in_ui[1].pressed.connect(self._on_next_pressed)

    # if has_node("Button"):
    #     var down_button = get_node("Button")
    #     down_button.notice_button_pressed.connect(self._on_button_pressed)

    # ui_sprite = get_node("Arrow")



func _on_title_pressed() -> void:
    SceneManager.go_to_next_scene()
    # get_tree().change_scene_to_file("res://scenes/title.tscn")

func _on_next_pressed() -> void:
    SceneManager.go_to_gameover()
    # get_tree().change_scene_to_file("res://scenes/stage_2.tscn")

# func _on_button_pressed() -> void:
#     ui_sprite.down()

func get_staged_line() -> Array[String]:
    var lines: Array[String] = [
        "Stage1 Stage1",
        "->> ->> ->>",
        "->> ->> ->>",
        "AAAHHH",
    ]

    return lines
