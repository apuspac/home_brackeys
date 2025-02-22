extends Node2D

@onready var text_label: Label = $MarginContainer/Label

const MAX_WIDTH: int = 512

var text: String = ""
var letter_index: int = 0

signal notice_finished_textdisplay()


func display_text(text_to_display: String) -> void:
    self.text = text_to_display
    text_label.text = text_to_display

    text_label.text = ""
    _display_letter_ratio()


func _display_letter_ratio() -> void:
    text_label.visible_ratio = 0
    text_label.text = self.text

    var tween = create_tween()
    tween.tween_property(text_label, "visible_ratio", 1, 0.5)
    tween.play()
    await tween.finished

    notice_finished_textdisplay.emit()
