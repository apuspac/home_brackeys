extends Control

@onready var timer: Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
    timer.timeout.connect(self._init_ready)
    timer.start(2.0)

func _init_ready():
    TextManager.start_dialog(self.position, sample_lines)

const sample_lines: Array[String] = [
    "aaaaa",
    "bbbbb",
    "ccccc"
]
