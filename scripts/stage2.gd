extends Node2D

var ui_arrow : Node2D
var ui_arrow2 : Node2D

enum Direction {IDLE, LEFT, RIGHT}

@onready var player: CharacterBody2D = $Player
@onready var camera: Camera2D = $Player/Camera2D

@onready var bridge: Node2D = $Bridge

func _ready() -> void:
    var game_in_ui = get_node("CanvasLayer/Control/HBoxContainer").get_children()
    game_in_ui[0].pressed.connect(self._on_title_pressed)
    game_in_ui[1].pressed.connect(self._on_next_pressed)

    player.notice_end_idle.connect(self._end_idle)

    var look_button = get_node("LookButton")
    look_button.notice_button_pressed.connect(self._on_button_pressed)

    var down_button = get_node("DownButton")
    down_button.notice_button_pressed.connect(self._on_button_pressed_down)

    var down_button2 = get_node("DownButton2")
    down_button2.notice_button_pressed.connect(self._on_button_pressed_down2)

    var ui_sprite = get_node("Arrow").get_children()
    ui_arrow = ui_sprite[0]
    ui_arrow2 = ui_sprite[1]




func _on_title_pressed() -> void:
    SceneManager.go_to_next_scene()

func _on_next_pressed() -> void:
    SceneManager.go_to_gameover()

func _on_button_pressed() -> Tween:
    player.direction = Direction.IDLE

    var tween = create_tween()
    tween.tween_property(camera, "position", Vector2(-190, -50), 0.5)
    tween.play()
    await tween.finished

    bridge.bridge_explosion()

    return tween


func _end_idle(_direction: Direction):
    camera_tween_back()

func camera_tween_back():
    var tween2 = create_tween()
    tween2.tween_property(camera, "position", Vector2(-100, -50), 0.5)
    tween2.play()
    await tween2.finished

func _on_button_pressed_down() -> void:
    ui_arrow.down()

func _on_button_pressed_down2() -> void:
    ui_arrow2.down()

func get_staged_line() -> Array[String]:
    var lines: Array[String] = [
        "Stage2 Stage2",
        "->> ->> ->>",
        "->> ->> ->>",
        "AAAHHH",
    ]

    return lines
