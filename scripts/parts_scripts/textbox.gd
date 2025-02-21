extends MarginContainer

@onready var text_label: Label = $MarginContainer/Label
@onready var timer: Timer = $DisplayTimer


const MAX_WIDTH: int = 256

var text: String = ""
var letter_index: int = 0

var letter_time: float = 0.03
var space_time: float = 0.06
var puctuation_time: float = 0.2

signal notice_finished_textdisplay()


func _ready():
    timer.timeout.connect(self._on_display_timer_timeout)

func display_text(text_to_display: String) -> void:
    self.text = text_to_display

    text_label.text = text_to_display

    await resized
    custom_minimum_size.x = min(size.x, MAX_WIDTH)

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




func _display_letter() -> void:
    if letter_index >= self.text.length():
        notice_finished_textdisplay.emit()
        return

    text_label.text += self.text[letter_index]
    letter_index += 1

    if letter_index < self.text.length():
        match self.text[letter_index]:
            "!", ".", ",", "?":
                timer.start(puctuation_time)
            " ":
                timer.start(space_time)
            _:
                timer.start(letter_time)

func _on_display_timer_timeout():
    _display_letter()
