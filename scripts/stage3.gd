extends Node2D

enum Direction {IDLE, LEFT, RIGHT}

@onready var wait_timer: Timer = $WaitTimer
@onready var load_wait_timer: Timer = $LoadWaitTimer

@onready var player: CharacterBody2D = $Player
@onready var camera: Camera2D = $Player/Camera2D
@onready var guide: Control = $CanvasLayer/GuideBox

var guide_textbox: MarginContainer

@onready var downed_textbox: StaticBody2D = $DownedTextBox
@onready var downed_textbox_node: Node2D = $DownedTextBox/DownTextBox
@onready var downed_textbox_collision: CollisionShape2D = $DownedTextBox/CollisionShape2D




func _ready() -> void:
    var game_in_ui = get_node("CanvasLayer/Control/HBoxContainer").get_children()
    game_in_ui[0].pressed.connect(self._on_title_pressed)
    game_in_ui[1].pressed.connect(self._on_next_pressed)

    player.notice_end_idle.connect(self._end_idle)

    var look_button = get_node("LookButton")
    look_button.notice_button_pressed.connect(self._on_button_pressed)

    var down_button = get_node("DownButton")
    down_button.notice_button_pressed.connect(self._on_button_pressed_down)

    wait_timer.timeout.connect(self._on_ready_gimmick)
    load_wait_timer.timeout.connect(self._on_load_end)
    load_wait_timer.start(2.0)

    downed_textbox.visible = false
    downed_textbox_collision.disabled = true


    var downed_nexttextbox_area = get_node("DonwedTextBoxNext").get_children()
    downed_nexttextbox_area[0].notice_enter_next_downedtextbox.connect(self._nexttext_downed_textbox)
    downed_nexttextbox_area[1].notice_enter_next_downedtextbox.connect(self._nexttext_downed_textbox)



func _on_load_end() -> void:
    guide_textbox = $CanvasLayer/TextBoxCanvas
    print_debug(guide_textbox)



func _on_title_pressed() -> void:
    get_tree().change_scene_to_file("res://scenes/title.tscn")

func _on_next_pressed() -> void:
    get_tree().change_scene_to_file("res://scenes/stage_3.tscn")

func _on_button_pressed() -> Tween:
    player.direction = Direction.IDLE

    var tween = create_tween()
    tween.tween_property(camera, "position", Vector2(-190, -50), 0.5)
    tween.play()
    await tween.finished

    return tween



func _on_button_pressed_down() -> void:
    # _on_button_pressed()
    await _on_button_pressed()

    # なぜかnodeが取れないことがある。ので、保険のためnodeを取っとく。
    if guide_textbox == null:
        guide_textbox = $CanvasLayer/TextBoxCanvas

    guide.tween_position(Vector2(0, 1000))
    guide_textbox.tween_position(Vector2(0, 1000))

    downed_textbox.visible = true
    downed_textbox_collision.disabled = false




func _end_idle(_direction: Direction):
    camera_tween_back()

func camera_tween_back():
    var tween2 = create_tween()
    tween2.tween_property(camera, "position", Vector2(-100, -50), 0.5)
    tween2.play()
    await tween2.finished



func _nexttext_downed_textbox():
    downed_textbox_node._enterd_next_textbox_area()


func _on_ready_gimmick():
    player.direction = Direction.LEFT


func get_staged_line() -> Array[String]:
    var lines: Array[String] = [
        "It's dangerous here!",
        "Turn back now!",
        "Waaaah"
    ]

    return lines