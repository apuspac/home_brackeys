extends CharacterBody2D


var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")
var JUMP_VELOCITY: float  = -500.0
var SPEED: float = 200.0

enum Direction {IDLE, LEFT, RIGHT}
var direction: Direction
var sprite: AnimatedSprite2D

signal notice_end_idle(state: Direction)

func _ready():
    direction = Direction.IDLE
    sprite = get_node("AnimatedSprite2D")



func _physics_process(delta: float) -> void:
    if direction == Direction.RIGHT or direction == Direction.LEFT:
        if is_on_wall():
            _on_wall_collision()

    match direction:
        Direction.IDLE:
            idle()
        Direction.LEFT:
            move(delta)
        Direction.RIGHT:
            move(delta)


    # tutorialと stageで 別々にしたいが、この処理でいっか。
func idle() -> void:
    if Input.is_action_pressed("ui_left"):
        direction = Direction.LEFT
        notice_end_idle.emit(Direction.LEFT)
    elif Input.is_action_pressed("ui_right"):
        direction = Direction.RIGHT
        notice_end_idle.emit(Direction.RIGHT)


func move(delta) -> void:
    if not is_on_floor():
        velocity.y += GRAVITY * delta

    if Input.is_action_pressed("ui_accept") and is_on_floor():
        velocity.y = JUMP_VELOCITY

    if direction == Direction.RIGHT:
        velocity.x = SPEED
    elif direction == Direction.LEFT:
        velocity.x = -SPEED

    move_and_slide()

func _on_wall_collision() -> void:
    print_debug("wall collision")

    if direction == Direction.RIGHT:
        direction = Direction.LEFT
    else:
        direction = Direction.RIGHT


func _process(_delta):
    change_animation()

func change_animation() -> void:
    if direction == Direction.RIGHT:
        sprite.flip_h = false
    elif direction == Direction.LEFT:
        sprite.flip_h = true
