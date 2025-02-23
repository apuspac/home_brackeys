extends CharacterBody2D

@onready var timer: Timer = $Timer
@onready var label: Label = $Sprite2D/Label

var SPEED: float = 200.0

signal notice_on_hit()

var rng = RandomNumberGenerator.new()

func _ready():
    timer.timeout.connect(self.free)
    timer.start(30.0)
    velocity = Vector2(0, SPEED)


func _physics_process(delta):

    var collision = move_and_collide(velocity * delta)

    if collision:
        notice_on_hit.emit()
        queue_free()
    else:
        move_and_slide()

func free():
    queue_free()

func _on_VisibilityNotifier2D_screen_exited():
    queue_free()



func set_label(bullet_text: String):
    label.text = bullet_text