extends CharacterBody2D

@onready var timer: Timer = $Timer
@onready var label: Label = $Sprite2D/Label
@onready var collision_area = $CollisionShape2D

var SPEED: float = 200.0

signal notice_on_hit()

var rng = RandomNumberGenerator.new()

func _ready():
    timer.timeout.connect(self.free)
    timer.start(10.0)
    velocity = Vector2(0, SPEED)


func _physics_process(delta):
    var collision = move_and_collide(velocity * delta)

    if collision:
        notice_on_hit.emit()
        queue_free()

func free():
    queue_free()

func _on_VisibilityNotifier2D_screen_exited():
    queue_free()


func set_label(bullet_text: String):
    label.text = bullet_text

func change_collision_size(area_type: int):
    var new_shape= RectangleShape2D.new()
    var offset: float

    match area_type:
        0:
            new_shape.size = Vector2(96, 40)
            offset = 40.0
        1:
            new_shape.size = Vector2(48, 40)
            offset = 15.0
        2:
            new_shape.size = Vector2(96, 40)
            offset = 40.0

    collision_area.shape = new_shape

    collision_area.position += Vector2(offset, 0)