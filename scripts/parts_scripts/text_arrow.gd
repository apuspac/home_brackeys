extends CharacterBody2D

@onready var timer: Timer = $Timer
var SPEED: float = 200.0

signal notice_on_hit()


func _ready():
    timer.timeout.connect(self.free)
    timer.start(30.0)
    velocity = Vector2(SPEED, 0)

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