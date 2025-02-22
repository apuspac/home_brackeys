extends TextManagerClass

var canvas_path: String

func start_dialog(position: Vector2, lines: Array[String], _canvas_path: String=""):
    canvas_path = _canvas_path


    if is_dialog_active:
        return

    dialog_lines = lines
    text_box_position = position
    _show_text_box()

    is_dialog_active = true

func _show_text_box():
    text_box = text_box_scene.instantiate()
    text_box.notice_finished_textdisplay.connect(self._on_text_box_finished_displaying)

    get_tree().root.get_node(canvas_path).add_child.call_deferred(text_box)
    _display_text.call_deferred()

func _unhandled_input(_event):
    if (
        _event.is_action_pressed("ui_accept") &&
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