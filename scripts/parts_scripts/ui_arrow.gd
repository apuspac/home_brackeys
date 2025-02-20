extends Node2D

var animation_down: AnimationPlayer

func _ready():
    if has_node("AnimationPlayer") == true:
        animation_down = get_node("AnimationPlayer")

func down():
    animation_down.play("down")
