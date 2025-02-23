extends CharacterBody2D


var SPEED: float = 200.0

func _physics_process(delta):
    velocity.x = SPEED

    move_and_slide()