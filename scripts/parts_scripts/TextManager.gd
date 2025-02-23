class_name TextManagerClass
extends Node

@onready var text_box_scene = preload("res://scenes/parts_scenes/text_box.tscn")

var dialog_lines: Array[String] = []
var current_line_index = 0

var text_box
var text_box_position: Vector2

# var is_dialog_active = false
var can_advance_line = false

var add_child_path: String


func start_dialog(position: Vector2, lines: Array[String], _path: String = ""):
    # if is_dialog_active:
    #     return
        # is_dialog_active = false
    current_line_index = 0

    add_child_path = _path

    dialog_lines = lines
    text_box_position = position

    _show_text_box()

    # is_dialog_active = true


func _show_text_box():
    text_box = text_box_scene.instantiate()
    text_box.notice_finished_textdisplay.connect(self._on_text_box_finished_displaying)

    get_tree().root.get_node(add_child_path).add_child.call(text_box)
    text_box.position = text_box_position
    text_box.display_text(dialog_lines[current_line_index])
    can_advance_line = false

func change_scene():
    text_box.queue_free()
    # is_dialog_active = false
    print_debug("start_dialog")



func _on_text_box_finished_displaying():
    can_advance_line = true

# func _unhandled_input(event):
#     if (
#         event.is_action_pressed("ui_accept") &&
#         is_dialog_active &&
#         can_advance_line
#     ):
#         text_box.queue_free()

#         current_line_index += 1

#         # 表示すべきlineが終わったら
#         if current_line_index >= dialog_lines.size():
#             is_dialog_active = false
#             current_line_index = 0
#             return

#         _show_text_box()


func _enterd_next_textbox_area():
    text_box.queue_free()

    current_line_index += 1

    if current_line_index >= dialog_lines.size():
        # is_dialog_active = false
        current_line_index = 0
        return

    _show_text_box()
