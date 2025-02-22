extends Control

@onready var timer: Timer = $Timer
@onready var guide: Control = $Guide


# Called when the node enters the scene tree for the first time.
func _ready():
    guide.visible = false
    timer.timeout.connect(self._init_ready)
    timer.start(0.3)

func _init_ready():
    print_debug(get_parent().get_path())
    guide.visible = true
    TextManager.start_dialog(self.position, sample_lines, get_parent().get_path())

func tween_position(_pos: Vector2):
    var tween = create_tween()
    # 192, 128
    tween.tween_property(self, "position", self.position +  _pos, 0.5)
    tween.play()
    await tween.finished


var sample_lines: Array[String] = [
    "aaaaaaa",
    "bbbbbbbbbbb",
    "ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc"
]
