extends Control

@onready var timer: Timer = $Timer
@onready var guide: Control = $Guide

var text_lines: Array[String]

# Called when the node enters the scene tree for the first time.
func _ready():
    guide.visible = false
    timer.timeout.connect(self._init_ready)
    timer.start(0.3)

func _init_ready():
    guide.visible = true

    # stage_nodeからcall
    var parent =  get_parent().get_parent()
    text_lines = parent.get_staged_line()

    TextManager.start_dialog(self.position, text_lines, get_parent().get_path())

func tween_position(_pos: Vector2):
    var tween = create_tween()
    # 192, 128
    tween.tween_property(self, "position", self.position +  _pos, 0.5)
    tween.play()
    await tween.finished
