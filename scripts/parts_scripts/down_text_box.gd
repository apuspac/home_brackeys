extends Node

var dialog_lines: Array[String] = []
var current_line_index = 0


var is_dialog_active = false
var can_advance_line = false

var add_child_path: String

@onready var text_box = $Node2D

var sample_lines: Array[String] = [
    "down_test_box",
    "bbbbbbbbbbb",
    "ccccccccccccccccc"
]


func _ready():
    start_dialog(self.position, sample_lines)


func start_dialog(position: Vector2, lines: Array[String]):
    if is_dialog_active:
        return

    text_box.notice_finished_textdisplay.connect(self._on_text_box_finished_displaying)
    text_box.position = position

    dialog_lines = lines
    _show_text_box()

    is_dialog_active = true


func _show_text_box():
    text_box.global_position = self.position
    print_debug(text_box.position)
    text_box.display_text(dialog_lines[current_line_index])
    can_advance_line = false


func _on_text_box_finished_displaying():
    can_advance_line = true

func _enterd_next_textbox_area():
    current_line_index += 1

    if current_line_index >= dialog_lines.size():
        is_dialog_active = false
        current_line_index = 0
        return

    _show_text_box()

func _unhandled_input(event):
    if (
        event.is_action_pressed("ui_accept") &&
        is_dialog_active &&
        can_advance_line
    ):
        _enterd_next_textbox_area()
