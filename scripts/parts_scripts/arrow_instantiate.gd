extends Node2D


@onready var arrow = preload("res://scenes/parts_scenes/text_arrow.tscn")
@onready var timer_next_spawn = $Timer

var player: CharacterBody2D

var rng = RandomNumberGenerator.new()

func _ready():
    timer_next_spawn.timeout.connect(self.spawn_arrow)
    timer_next_spawn.start(0.5)

    player = get_parent().get_node("Player")

func _spawn_timer_end():
    spawn_arrow()
    timer_next_spawn.start(0.5)


func spawn_arrow():
    var arrow_instance = arrow.instantiate()
    arrow_instance.position.y = rng.randf_range(0, 200.0)

    add_child(arrow_instance)

    arrow_instance.notice_on_hit.connect(self._to_player_hit)

func _to_player_hit():
    player._on_wall_collision()


