extends Node2D

@onready var timer: Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
    timer.timeout.connect(self._init_ready)
    timer.start(1.0)

func _init_ready():
    # compositionの考えの場合、このStage2をexportから指定できるようにすればいい。はーなるほどね。
    print_debug(get_parent().get_path())
    TextManager.start_dialog(self.position, sample_lines, get_parent().get_path())


var sample_lines: Array[String] = [
    "aaaaaaa",
    "bbbbbbbbbbb",
    "ccccccccccccccccc"
]
