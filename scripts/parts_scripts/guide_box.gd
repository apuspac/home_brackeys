extends Control

@onready var timer: Timer = $Timer
@onready var guide: Control = $Guide


# Called when the node enters the scene tree for the first time.
func _ready():
    guide.visible = false
    timer.timeout.connect(self._init_ready)
    timer.start(0.5)

func _init_ready():
    print_debug(get_parent().get_path())
    guide.visible = true
    TextManager.start_dialog(self.position, sample_lines, get_parent().get_path())


var sample_lines: Array[String] = [
    "aaaaaaa",
    "bbbbbbbbbbb",
    "ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc"
]
