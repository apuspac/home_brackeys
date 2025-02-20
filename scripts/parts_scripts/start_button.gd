extends Button

signal start_pressed(key: String)

func _input(event):
    if event is InputEventKey and event.pressed:
        if event.keycode == KEY_LEFT:
            start_pressed.emit("left")
        if event.keycode == KEY_RIGHT:
            start_pressed.emit("right")
