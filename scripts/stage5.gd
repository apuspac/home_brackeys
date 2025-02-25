extends Node2D

@onready var clear_timer = $ClearTimer

@onready var guide: Control = $CanvasLayer/GuideBox
var guide_textbox: MarginContainer

@onready var box_explosion: Node2D = $BoxExplosion

func _ready() -> void:
    var game_in_ui = get_node("CanvasLayer/Control/HBoxContainer").get_children()
    game_in_ui[0].pressed.connect(self._on_title_pressed)
    game_in_ui[1].pressed.connect(self._on_next_pressed)

    var down_button = get_node("DownButton")
    down_button.notice_button_pressed.connect(self._on_button_pressed_down)

    clear_timer.timeout.connect(self._timeout_endtimer)


func _on_title_pressed() -> void:
    SceneManager.go_to_next_scene()

func _on_next_pressed() -> void:
    SceneManager.go_to_gameover()


func _on_button_pressed_down():
    # なぜかnodeが取れないことがある。ので、保険のためnodeを取っとく。
    # -> これ、たぶんですが、textboxが更新される関係でcontainer_nameがtmp_nameが使われるから。

    while(true):
        var layer_count = get_node("CanvasLayer").get_children()
        if layer_count.size() == 2:
            break



    if guide_textbox == null:
        var layer = get_node("CanvasLayer").get_children()
        print(layer)

        # guide_textbox = layer[2]

    guide.visible = false
    # guide_textbox.visible = false

    box_explosion.box_explosion()
    clear_timer.start(2.0)


func _timeout_endtimer():
    SceneManager.go_to_ending()


func get_staged_line() -> Array[String]:
    var lines: Array[String] = [
        "STOP, GO BACK",
        "aaahhh",
    ]

    return lines

