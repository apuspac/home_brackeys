extends Control

@onready var arrow_node: Control = $Arrow

func _ready() -> void:
    var start_menu = get_node("MarginContainer/VBoxContainer").get_children()
    start_menu[0].start_pressed.connect(self._on_start_pressed)
    start_menu[1].pressed.connect(self._on_quit_pressed)

    start_menu[0].grab_focus()

    if SceneManager.tutorial_count > 2:
        arrow_node.visible = true
    else:
        arrow_node.visible = false

func _on_start_pressed(key) -> void:
    if key == "right":
        SceneManager.go_to_tutorial()
    if key == "left":
        SceneManager.go_to_stage1()


func _on_quit_pressed() -> void:
    get_tree().quit()