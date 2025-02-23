extends Node2D


@onready var bullet = preload("res://scenes/parts_scenes/text_bullet.tscn")
@onready var timer_next_spawn = $Timer

var player: CharacterBody2D
var rng = RandomNumberGenerator.new()



var line: Array[String]= [
    "S",
    "T",
    "O",
    "P",
    ",",
    "G",
    "O",
    "!",
    "B",
    "A",
    "C",
    "K",
    "!",
]




func _ready():
    timer_next_spawn.timeout.connect(self.spawn_arrow)
    timer_next_spawn.start(1.0)

    # player = get_parent().get_node("Player")

func _spawn_timer_end():
    spawn_arrow()
    timer_next_spawn.start(0.5)


func spawn_arrow():
    var bullet_instance = bullet.instantiate()

    var text_index = rng.randi_range(0, line.size()-1)
    bullet_instance.position.x = 50 * (text_index + 1)

    add_child(bullet_instance)
    bullet_instance.set_label(line[text_index])
    bullet_instance.notice_on_hit.connect(self._to_player_hit)

func _to_player_hit():
    player._on_wall_collision()


