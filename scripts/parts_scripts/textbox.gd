extends MarginContainer

@onready var text_label: Label = $MarginContainer/Label


const MAX_WIDTH: int = 512

var text: String = ""
var letter_index: int = 0

signal notice_finished_textdisplay()


func _ready():
    pass


func tween_position(_pos: Vector2):
    var tween = create_tween()
    tween.tween_property(self, "position", self.position +  _pos, 0.5)
    tween.play()
    await tween.finished




func display_text(text_to_display: String) -> void:
    self.text = text_to_display

    text_label.text = text_to_display

    # 固定サイズにしたいので、常にMAX
    custom_minimum_size.x = MAX_WIDTH

    # await resized
    # custom_minimum_size.x = min(size.x, MAX_WIDTH)

    if size.x > MAX_WIDTH:
        text_label.autowrap_mode = TextServer.AUTOWRAP_WORD
        await resized
        await resized
        custom_minimum_size.y = size.y

    global_position.x -= size.x / 2
    global_position.y -= size.y + 24

    text_label.text = ""
    # _display_letter()
    _display_letter_ratio()


func _display_letter_ratio() -> void:
    text_label.visible_ratio = 0
    text_label.text = self.text

    var tween = create_tween()
    tween.tween_property(text_label, "visible_ratio", 1, 0.5)
    tween.play()
    await tween.finished

    notice_finished_textdisplay.emit()
