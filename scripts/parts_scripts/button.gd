extends Node2D

var sprite: AnimatedSprite2D

signal notice_button_pressed()

func _ready():
    var button_area = get_node("Area2D")
    button_area.body_entered.connect(self._on_button_pressed)

    sprite = get_node("AnimatedSprite2D")


func _on_button_pressed(body: Node) -> void:
    notice_button_pressed.emit()
    sprite.play("pressed")
