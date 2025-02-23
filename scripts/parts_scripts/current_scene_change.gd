extends Area2D

@onready var timer: Timer = $Timer

func _ready():
    self.body_entered.connect(self.prepare_next_scene)
    timer.timeout.connect(self.change_scene)

func prepare_next_scene(_body) -> void:
    timer.start(1.0)
    var player = get_parent().get_parent().get_node("Player")
    player.player_explosion()


func change_scene() -> void:
    SceneManager.return_to_current_scene()
