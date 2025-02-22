extends Node2D



enum Direction {IDLE, LEFT, RIGHT}

@onready var wait_timer: Timer
@onready var player: CharacterBody2D = get_node("Player")

func _ready() -> void:
    var game_in_ui = get_node("CanvasLayer/Control/HBoxContainer").get_children()
    game_in_ui[0].pressed.connect(self._on_title_pressed)
    game_in_ui[1].pressed.connect(self._on_next_pressed)

    if has_node("Button"):
        var down_button = get_node("Button")
        down_button.notice_button_pressed.connect(self._on_button_pressed)

    if has_node("WaitTimer"):
        wait_timer = get_node("WaitTimer")
        wait_timer.timeout.connect(self._on_ready_gimmick)




func _on_title_pressed() -> void:
    get_tree().change_scene_to_file("res://scenes/title.tscn")

func _on_next_pressed() -> void:
    get_tree().change_scene_to_file("res://scenes/stage_3.tscn")

func _on_button_pressed() -> void:
    wait_timer.start(400.0)
    player.direction = Direction.IDLE
    print_debug("pressed")
    # ui_sprite.down()

func _on_ready_gimmick():
    player.direction = Direction.LEFT