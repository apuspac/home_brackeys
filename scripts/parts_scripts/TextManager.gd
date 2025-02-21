extends Node


@onready var text_box_scene = preload("res://scenes/parts_scenes/text_box.tscn")

var dialog_lines: Array[String] = []
var current_line_index = 0

var text_box
var text_box_position: Vector2

var is_dialog_active = false
var can_advance_line = false


func start_dialog(position: Vector2, lines: Array[String]):
    if is_dialog_active:
        return

    dialog_lines = lines
    text_box_position = position
    _show_text_box()

    is_dialog_active = true


func _show_text_box():
    text_box = text_box_scene.instantiate()
    text_box.notice_finished_textdisplay.connect(self._on_text_box_finished_displaying)

    get_tree().root.add_child.call_deferred(text_box)
    _display_text.call_deferred()


func _display_text():
    text_box.global_position = text_box_position
    text_box.display_text(dialog_lines[current_line_index])
    can_advance_line = false


# 表示し終わったら次のlineへ 行けるってことかな
func _on_text_box_finished_displaying():
    can_advance_line = true

func _unhandled_input(event):
    if (
        event.is_action_pressed("ui_accept") &&
        is_dialog_active &&
        can_advance_line
    ):
        text_box.queue_free()

        current_line_index += 1

        # 表示すべきlineが終わったら
        if current_line_index >= dialog_lines.size():
            is_dialog_active = false
            current_line_index = 0
            return

        _show_text_box()
